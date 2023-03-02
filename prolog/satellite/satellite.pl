tree_traversals(Tree, Preorder, Inorder) :-
    preorder(Tree, Preorder, []),
    inorder(Tree, Inorder, []).

preorder(nil) --> [].
preorder(node(L,V,R)) --> [V], preorder(L), preorder(R).

inorder(nil) --> [].
inorder(node(L,V,R)) --> inorder(L), [V], inorder(R).
