W1 = reshape(theta(1:hiddenSize*visibleSize), hiddenSize, visibleSize);
W2 = reshape(theta(hiddenSize*visibleSize+1:2*hiddenSize*visibleSize), visibleSize, hiddenSize);
b1 = theta(2*hiddenSize*visibleSize+1:2*hiddenSize*visibleSize+hiddenSize);
b2 = theta(2*hiddenSize*visibleSize+hiddenSize+1:end);

cost = 0;
W1grad = zeros(size(W1)); 
W2grad = zeros(size(W2));
b1grad = zeros(size(b1)); 
b2grad = zeros(size(b2));

m=size(data,2);
a2=sigmoid(bsxfun(@plus,W1*data,b1));
a3=bsxfun(@plus,W2*a2,b2);
squared_error=sum(sum((a3-data).^2))/(2*m);
weight_decay=lambda/2*(sum(sum(W1.^2))+sum(sum(W2.^2)));
pj=mean(a2,2);
sparsity_penalty=sparsityParam.*log(sparsityParam./pj)+(1-sparsityParam).*log((1-sparsityParam)./(1.-pj));
d3=(a3-data);
d2=(W2'*d3+beta.*repmat((-sparsityParam./pj+(1-sparsityParam)./(1.-pj)),1,size(data,2))).*(a2.*(1-a2));   %d2 25X10000
W2grad=d3*a2'./m+lambda*W2;
b2grad=sum(d3,2)./m;
W1grad=d2*data'./m+lambda*W1;
b1grad=sum(d2,2)./m;
cost=squared_error+weight_decay+beta*sum(sparsity_penalty);