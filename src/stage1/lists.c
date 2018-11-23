struct typtyp {
	struct typtyp* parent;
	struct typtyp* isnumber;
	char[6] type;
};

struct node {
	struct node* prev;
	struct node* next;
};

struct leaf {
	struct leaf* parent;
};

struct typtyp* type_table_typtyp = (type_table_word){.parent = *type_table_typtyp, .isnumber = *type_table_typtyp, .type = "illegl"}
struct typtyp* type_table_number = (type_table_number){.parent = *type_table_number, .isnumber = *type_table_number, .type = "number"}
struct typtyp* type_table_notnum = (type_table_notnum){.parent = *type_table_notnum, .isnumber = *type_table_notnum, .type = "notnum"}
struct typtyp* type_table_unknow = (type_table_unknow){.parent = *type_table_unknow, .isnumber = *type_table_unknow, .type = "unknow"}
struct typtyp* type_table_unform = (type_table_unform){.parent = *type_table_unform, .isnumber = *type_table_number, .type = "unform"}
struct typtyp* type_table_signed = (type_table_signed){.parent = *type_table_signed, .isnumber = *type_table_number, .type = "signed"}
struct typtyp* type_table_unsign = (type_table_unsign){.parent = *type_table_unsign, .isnumber = *type_table_number, .type = "unsign"}
struct typtyp* type_table_real = (type_table_real){.parent = *type_table_real, .isnumber = *type_table_number, .type = "real"}
struct typtyp* type_table_complx = (type_table_complx){.parent = *type_table_complx, .isnumber = *type_table_complx, .type = "complx"}
struct typtyp* type_table_timtyp = (type_table_timtyp){.parent = *type_table_timtyp, .isnumber = *type_table_timtyp, .type = "timtyp"}
struct typtyp* type_table_divtyp = (type_table_divtyp){.parent = *type_table_divtyp, .isnumber = *type_table_divtyp, .type = "divtyp"}
struct typtyp* type_table_void = (type_table_void){.parent = *type_table_void, .isnumber = *type_table_unkown, .type = "void"}
struct typtyp* type_table_bool = (type_table_bool){.parent = *type_table_signed, .isnumber = *type_table_signed, .type = "bool"}
struct typtyp* type_table_byte = (type_table_byte){.parent = *type_table_unform, .isnumber = *type_table_unform, .type = "byte"}
struct typtyp* type_table_word = (type_table_word){.parent = *type_table_unform, .isnumber = *type_table_unform, .type = "word"}
struct typtyp* type_table_long = (type_table_long){.parent = *type_table_unform, .isnumber = *type_table_unform, .type = "long"}
struct typtyp* type_table_quad = (type_table_quad){.parent = *type_table_unform, .isnumber = *type_table_unform, .type = "quad"}
struct typtyp* type_table_s_byte = (type_table_s_byte){.parent = *type_table_signed, .isnumber = *type_table_signed, .type = "s_byte"}
struct typtyp* type_table_s_word = (type_table_s_word){.parent = *type_table_signed, .isnumber = *type_table_signed, .type = "s_word"}
struct typtyp* type_table_s_long = (type_table_s_long){.parent = *type_table_signed, .isnumber = *type_table_signed, .type = "s_long"}
struct typtyp* type_table_s_quad = (type_table_s_quad){.parent = *type_table_signed, .isnumber = *type_table_signed, .type = "s_quad"}
struct typtyp* type_table_u_byte = (type_table_u_byte){.parent = *type_table_unsign, .isnumber = *type_table_unsign, .type = "u_byte"}
struct typtyp* type_table_u_word = (type_table_u_word){.parent = *type_table_unsign, .isnumber = *type_table_unsign, .type = "u_word"}
struct typtyp* type_table_u_long = (type_table_u_long){.parent = *type_table_unsign, .isnumber = *type_table_unsign, .type = "u_long"}
struct typtyp* type_table_u_quad = (type_table_u_quad){.parent = *type_table_unsign, .isnumber = *type_table_unsign, .type = "u_quad"}
struct typtyp* type_table_float = (type_table_float){.parent = *type_table_real, .isnumber = *type_table_real, .type = "float"}
struct typtyp* type_table_double = (type_table_double){.parent = *type_table_real, .isnumber = *type_table_real, .type = "double"}
struct typtyp* type_table_enumer = (type_table_enumer){.parent = *type_table_unsign, .isnumber = *type_table_unsign, .type = "enumer"}
struct typtyp* type_table_array = (type_table_array){.parent = *type_table_array, .isnumber = *type_table_void, .type = "array"}
struct typtyp* type_table_node = (type_table_node){.parent = *type_table_node, .isnumber = *type_table_struct, .type = "node"}
struct typtyp* type_table_llist = (type_table_llist){.parent = *type_table_llist, .isnumber = *type_table_node, .type = "llist"}
struct typtyp* type_table_leaf = (type_table_leaf){.parent = *type_table_leaf, .isnumber = *type_table_struct, .type = "leaf"}
struct typtyp* type_table_string = (type_table_string){.parent = *type_table_string, .isnumber = *type_table_notnum, .type = "string"}
struct typtyp* type_table_file = (type_table_file){.parent = *type_table_file, .isnumber = *type_table_string, .type = "file"}
struct typtyp* type_table_input = (type_table_input){.parent = *type_table_input, .isnumber = *type_table_file, .type = "input"}
struct typtyp* type_table_output = (type_table_output){.parent = *type_table_output, .isnumber = *type_table_file, .type = "output"}
