Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 36E952D1C62
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  7 Dec 2020 22:54:01 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kmOSD-0001WH-OY; Mon, 07 Dec 2020 21:53:57 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <joe@perches.com>) id 1kmOSB-0001W5-QC
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 07 Dec 2020 21:53:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Content-Type
 :References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VzX1Rfha0V3w6zQ+9vzOiyq7WQPxf6rROHS/m0ftcuc=; b=nSqrkkk+Rat27ogY1vl+PA7+9l
 aZ4OzTCHhwrEc/yPON9zn2Q4fqgxoWKBJPS8aFh2n4CPVh3L7c5sjJ062MAtd/iT58w/xlRm4sLQd
 w0eqhTyX+uly3QrpPYrEFZ8EUQ7pDWdl4YhWFLPzhwbBXSMxUELbepISGXH/AL+YWneM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:
 In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=VzX1Rfha0V3w6zQ+9vzOiyq7WQPxf6rROHS/m0ftcuc=; b=HoUpCOeXYMtwANa6O1W6HFU/Ba
 vD5NyZeg+83I6n6sgqYDtE9vON45vIruky3Qsfhku/nqEO5G8rbz4KEmtoqPF+LrKTsztslOncfH2
 1Y6W71A3lBIAXYy9W8IVAmVaYp213RJckyQarMs+5ubX87MWR4L1/BwDP8HI8xkMMvzQ=;
Received: from smtprelay0022.hostedemail.com ([216.40.44.22]
 helo=smtprelay.hostedemail.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kmOS1-002ZSB-PG
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 07 Dec 2020 21:53:55 +0000
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay01.hostedemail.com (Postfix) with ESMTP id 98E05100E7B40;
 Mon,  7 Dec 2020 21:53:32 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2, 0, 0, , d41d8cd98f00b204, joe@perches.com, ,
 RULES_HIT:1:41:69:355:379:599:960:966:968:973:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1593:1594:1730:1747:1777:1792:2194:2196:2199:2200:2393:2553:2559:2562:2638:2692:2828:2898:3138:3139:3140:3141:3142:3354:3622:3865:3866:3867:3868:3870:3871:3872:4250:4303:4321:4384:4385:4395:4605:5007:6117:7903:7904:8957:9592:10004:10848:11026:11232:11233:11473:11658:11914:12043:12291:12296:12297:12438:12555:12683:12740:12760:12895:12986:13161:13229:13439:14659:21080:21324:21433:21451:21626:21740:21939:21990:30012:30054:30056:30070:30090:30091,
 0, RBL:none, CacheIP:none, Bayesian:0.5, 0.5, 0.5, Netcheck:none,
 DomainCache:0, MSF:not bulk, SPF:, MSBL:0, DNSBL:none, Custom_rules:0:0:0,
 LFtime:1, LUA_SUMMARY:none
X-HE-Tag: cave79_04001bc273e1
X-Filterd-Recvd-Size: 13367
Received: from XPS-9350.home (unknown [47.151.137.21])
 (Authenticated sender: joe@perches.com)
 by omf17.hostedemail.com (Postfix) with ESMTPA;
 Mon,  7 Dec 2020 21:53:31 +0000 (UTC)
Message-ID: <9aed191d0babdfc9da202faab930623a6aa35c61.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Eric Biggers <ebiggers@kernel.org>, Chao Yu <yuchao0@huawei.com>
Date: Mon, 07 Dec 2020 13:53:30 -0800
In-Reply-To: <X86Sb2pvD53MzO5+@gmail.com>
References: <20201126103209.67985-1-yuchao0@huawei.com>
 <X86Sb2pvD53MzO5+@gmail.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [216.40.44.22 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [216.40.44.22 listed in list.dnswl.org]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1kmOS1-002ZSB-PG
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: compress: support chksum
X-BeenThere: linux-f2fs-devel@lists.sourceforge.net
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-f2fs-devel.lists.sourceforge.net>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/linux-f2fs-devel>, 
 <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=linux-f2fs-devel>
List-Post: <mailto:linux-f2fs-devel@lists.sourceforge.net>
List-Help: <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel>, 
 <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=subscribe>
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, 2020-12-07 at 12:37 -0800, Eric Biggers wrote:
> On Thu, Nov 26, 2020 at 06:32:09PM +0800, Chao Yu wrote:
> > +	if (!ret && fi->i_compress_flag & 1 << COMPRESS_CHKSUM) {
> 
> This really could use some parentheses.  People shouldn't have to look up a
> C operator precedence table to understand the code.
> 
> > +		u32 provided = le32_to_cpu(dic->cbuf->chksum);
> > +		u32 calculated = f2fs_crc32(sbi, dic->cbuf->cdata, dic->clen);
> > +
> > +		if (provided != calculated) {
> > +			if (!is_inode_flag_set(dic->inode, FI_COMPRESS_CORRUPT)) {
> > +				set_inode_flag(dic->inode, FI_COMPRESS_CORRUPT);
> > +				printk_ratelimited(
> > +					"%sF2FS-fs (%s): checksum invalid, nid = %lu, %x vs %x",
> > +					KERN_INFO, sbi->sb->s_id, dic->inode->i_ino,
> > +					provided, calculated);
> > +			}
> > +			set_sbi_flag(sbi, SBI_NEED_FSCK);
> > +			WARN_ON_ONCE(1);
> 
> WARN, WARN_ON_ONCE, BUG, BUG_ON, etc. are only for kernel bugs, not for invalid
> inputs from disk or userspace.
> 
> There is already a log message printed just above, so it seems this WARN_ON_ONCE
> should just be removed.

And this should probably be
				pr_info_ratelimited("F2FS-fs etc...);
with a terminating newline in the format too.

With the current -next, maybe adding new f2fs_<level>_ratelimited macros
would make more sense.

The logging macro definitions are moved to allow the f2fs_<level>_ratelimited
to work for the one use in f2fs_show_injection_info.

This also adds some missing newline terminations to formats.

---
 fs/f2fs/compress.c | 79 +++++++++++++++++++++++++-----------------------------
 fs/f2fs/dir.c      |  7 +++--
 fs/f2fs/f2fs.h     | 60 ++++++++++++++++++++++++++++-------------
 fs/f2fs/segment.c  |  6 ++---
 4 files changed, 83 insertions(+), 69 deletions(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index 08987923513d..587dae6c0947 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -211,8 +211,8 @@ static int lzo_compress_pages(struct compress_ctx *cc)
 	ret = lzo1x_1_compress(cc->rbuf, cc->rlen, cc->cbuf->cdata,
 					&cc->clen, cc->private);
 	if (ret != LZO_E_OK) {
-		printk_ratelimited("%sF2FS-fs (%s): lzo compress failed, ret:%d\n",
-				KERN_ERR, F2FS_I_SB(cc->inode)->sb->s_id, ret);
+		f2fs_err_ratelimited(F2FS_I_SB(cc->inode),
+				     "lzo compress failed, ret:%d\n", ret);
 		return -EIO;
 	}
 	return 0;
@@ -225,17 +225,16 @@ static int lzo_decompress_pages(struct decompress_io_ctx *dic)
 	ret = lzo1x_decompress_safe(dic->cbuf->cdata, dic->clen,
 						dic->rbuf, &dic->rlen);
 	if (ret != LZO_E_OK) {
-		printk_ratelimited("%sF2FS-fs (%s): lzo decompress failed, ret:%d\n",
-				KERN_ERR, F2FS_I_SB(dic->inode)->sb->s_id, ret);
+		f2fs_err_ratelimited(F2FS_I_SB(dic->inode),
+				     "lzo decompress failed, ret:%d\n", ret);
 		return -EIO;
 	}
 
 	if (dic->rlen != PAGE_SIZE << dic->log_cluster_size) {
-		printk_ratelimited("%sF2FS-fs (%s): lzo invalid rlen:%zu, "
-					"expected:%lu\n", KERN_ERR,
-					F2FS_I_SB(dic->inode)->sb->s_id,
-					dic->rlen,
-					PAGE_SIZE << dic->log_cluster_size);
+		f2fs_err_ratelimited(F2FS_I_SB(dic->inode),
+				     "lzo invalid rlen:%zu, expected:%lu\n",
+				     dic->rlen,
+				     PAGE_SIZE << dic->log_cluster_size);
 		return -EIO;
 	}
 	return 0;
@@ -292,17 +291,16 @@ static int lz4_decompress_pages(struct decompress_io_ctx *dic)
 	ret = LZ4_decompress_safe(dic->cbuf->cdata, dic->rbuf,
 						dic->clen, dic->rlen);
 	if (ret < 0) {
-		printk_ratelimited("%sF2FS-fs (%s): lz4 decompress failed, ret:%d\n",
-				KERN_ERR, F2FS_I_SB(dic->inode)->sb->s_id, ret);
+		f2fs_err_ratelimited(F2FS_I_SB(dic->inode),
+				     "lz4 decompress failed, ret:%d\n", ret);
 		return -EIO;
 	}
 
 	if (ret != PAGE_SIZE << dic->log_cluster_size) {
-		printk_ratelimited("%sF2FS-fs (%s): lz4 invalid rlen:%zu, "
-					"expected:%lu\n", KERN_ERR,
-					F2FS_I_SB(dic->inode)->sb->s_id,
-					dic->rlen,
-					PAGE_SIZE << dic->log_cluster_size);
+		f2fs_err_ratelimited(F2FS_I_SB(dic->inode),
+				     "lz4 invalid rlen:%zu, expected:%lu\n",
+				     dic->rlen,
+				     PAGE_SIZE << dic->log_cluster_size);
 		return -EIO;
 	}
 	return 0;
@@ -336,9 +334,8 @@ static int zstd_init_compress_ctx(struct compress_ctx *cc)
 
 	stream = ZSTD_initCStream(params, 0, workspace, workspace_size);
 	if (!stream) {
-		printk_ratelimited("%sF2FS-fs (%s): %s ZSTD_initCStream failed\n",
-				KERN_ERR, F2FS_I_SB(cc->inode)->sb->s_id,
-				__func__);
+		f2fs_err_ratelimited(F2FS_I_SB(cc->inode),
+				     "%s ZSTD_initCStream failed\n", __func__);
 		kvfree(workspace);
 		return -EIO;
 	}
@@ -376,17 +373,17 @@ static int zstd_compress_pages(struct compress_ctx *cc)
 
 	ret = ZSTD_compressStream(stream, &outbuf, &inbuf);
 	if (ZSTD_isError(ret)) {
-		printk_ratelimited("%sF2FS-fs (%s): %s ZSTD_compressStream failed, ret: %d\n",
-				KERN_ERR, F2FS_I_SB(cc->inode)->sb->s_id,
-				__func__, ZSTD_getErrorCode(ret));
+		f2fs_err_ratelimited(F2FS_I_SB(cc->inode),
+				     "%s ZSTD_compressStream failed, ret: %d\n",
+				     __func__, ZSTD_getErrorCode(ret));
 		return -EIO;
 	}
 
 	ret = ZSTD_endStream(stream, &outbuf);
 	if (ZSTD_isError(ret)) {
-		printk_ratelimited("%sF2FS-fs (%s): %s ZSTD_endStream returned %d\n",
-				KERN_ERR, F2FS_I_SB(cc->inode)->sb->s_id,
-				__func__, ZSTD_getErrorCode(ret));
+		f2fs_err_ratelimited(F2FS_I_SB(cc->inode),
+				     "%s ZSTD_endStream returned %d\n",
+				     __func__, ZSTD_getErrorCode(ret));
 		return -EIO;
 	}
 
@@ -418,9 +415,8 @@ static int zstd_init_decompress_ctx(struct decompress_io_ctx *dic)
 
 	stream = ZSTD_initDStream(max_window_size, workspace, workspace_size);
 	if (!stream) {
-		printk_ratelimited("%sF2FS-fs (%s): %s ZSTD_initDStream failed\n",
-				KERN_ERR, F2FS_I_SB(dic->inode)->sb->s_id,
-				__func__);
+		f2fs_err_ratelimited(F2FS_I_SB(dic->inode),
+				     "%s ZSTD_initDStream failed\n", __func__);
 		kvfree(workspace);
 		return -EIO;
 	}
@@ -455,18 +451,17 @@ static int zstd_decompress_pages(struct decompress_io_ctx *dic)
 
 	ret = ZSTD_decompressStream(stream, &outbuf, &inbuf);
 	if (ZSTD_isError(ret)) {
-		printk_ratelimited("%sF2FS-fs (%s): %s ZSTD_compressStream failed, ret: %d\n",
-				KERN_ERR, F2FS_I_SB(dic->inode)->sb->s_id,
-				__func__, ZSTD_getErrorCode(ret));
+		f2fs_err_ratelimited(F2FS_I_SB(dic->inode),
+				     "%s ZSTD_compressStream failed, ret: %d\n",
+				     __func__, ZSTD_getErrorCode(ret));
 		return -EIO;
 	}
 
 	if (dic->rlen != outbuf.pos) {
-		printk_ratelimited("%sF2FS-fs (%s): %s ZSTD invalid rlen:%zu, "
-				"expected:%lu\n", KERN_ERR,
-				F2FS_I_SB(dic->inode)->sb->s_id,
-				__func__, dic->rlen,
-				PAGE_SIZE << dic->log_cluster_size);
+		f2fs_err_ratelimited(F2FS_I_SB(dic->inode),
+				     "%s ZSTD invalid rlen:%zu, expected:%lu\n",
+				     __func__, dic->rlen,
+				     PAGE_SIZE << dic->log_cluster_size);
 		return -EIO;
 	}
 
@@ -492,8 +487,8 @@ static int lzorle_compress_pages(struct compress_ctx *cc)
 	ret = lzorle1x_1_compress(cc->rbuf, cc->rlen, cc->cbuf->cdata,
 					&cc->clen, cc->private);
 	if (ret != LZO_E_OK) {
-		printk_ratelimited("%sF2FS-fs (%s): lzo-rle compress failed, ret:%d\n",
-				KERN_ERR, F2FS_I_SB(cc->inode)->sb->s_id, ret);
+		f2fs_err_ratelimited(F2FS_I_SB(cc->inode),
+				     "lzo-rle compress failed, ret:%d\n", ret);
 		return -EIO;
 	}
 	return 0;
@@ -808,10 +803,10 @@ void f2fs_decompress_pages(struct bio *bio, struct page *page, bool verity)
 		if (provided != calculated) {
 			if (!is_inode_flag_set(dic->inode, FI_COMPRESS_CORRUPT)) {
 				set_inode_flag(dic->inode, FI_COMPRESS_CORRUPT);
-				printk_ratelimited(
-					"%sF2FS-fs (%s): checksum invalid, nid = %lu, %x vs %x",
-					KERN_INFO, sbi->sb->s_id, dic->inode->i_ino,
-					provided, calculated);
+				f2fs_info_ratelimited(sbi,
+						      "checksum invalid, nid = %lu, %x vs %x\n",
+						      dic->inode->i_ino,
+						      provided, calculated);
 			}
 			set_sbi_flag(sbi, SBI_NEED_FSCK);
 			WARN_ON_ONCE(1);
diff --git a/fs/f2fs/dir.c b/fs/f2fs/dir.c
index 82b58d1f80eb..184989dfc8a5 100644
--- a/fs/f2fs/dir.c
+++ b/fs/f2fs/dir.c
@@ -1008,10 +1008,9 @@ int f2fs_fill_dentries(struct dir_context *ctx, struct f2fs_dentry_ptr *d,
 		if (de->name_len == 0) {
 			bit_pos++;
 			ctx->pos = start_pos + bit_pos;
-			printk_ratelimited(
-				"%sF2FS-fs (%s): invalid namelen(0), ino:%u, run fsck to fix.",
-				KERN_WARNING, sbi->sb->s_id,
-				le32_to_cpu(de->ino));
+			f2fs_warn_ratelimited(sbi,
+					      "invalid namelen(0), ino:%u, run fsck to fix\n",
+					      le32_to_cpu(de->ino));
 			set_sbi_flag(sbi, SBI_NEED_FSCK);
 			continue;
 		}
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 5cd1b9f7cc53..c6cff897f886 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1573,12 +1573,48 @@ struct f2fs_private_dio {
 	bool write;
 };
 
+__printf(2, 3)
+void f2fs_printk(struct f2fs_sb_info *sbi, const char *fmt, ...);
+
+#define f2fs_err(sbi, fmt, ...)						\
+	f2fs_printk(sbi, KERN_ERR fmt, ##__VA_ARGS__)
+#define f2fs_warn(sbi, fmt, ...)					\
+	f2fs_printk(sbi, KERN_WARNING fmt, ##__VA_ARGS__)
+#define f2fs_notice(sbi, fmt, ...)					\
+	f2fs_printk(sbi, KERN_NOTICE fmt, ##__VA_ARGS__)
+#define f2fs_info(sbi, fmt, ...)					\
+	f2fs_printk(sbi, KERN_INFO fmt, ##__VA_ARGS__)
+#define f2fs_debug(sbi, fmt, ...)					\
+	f2fs_printk(sbi, KERN_DEBUG fmt, ##__VA_ARGS__)
+
+/* Ratelimited variants of the above logging uses*/
+
+#define f2fs_printk_ratelimited(sbi, fmt, ...)				\
+({									\
+	static DEFINE_RATELIMIT_STATE(_rs,				\
+				      DEFAULT_RATELIMIT_INTERVAL,	\
+				      DEFAULT_RATELIMIT_BURST);		\
+									\
+	if (__ratelimit(&_rs))						\
+		f2fs_printk(sbi, fmt, ##__VA_ARGS__);			\
+})
+
+#define f2fs_err_ratelimited(sbi, fmt, ...)				\
+	f2fs_printk_ratelimited(sbi, KERN_ERR fmt, ##__VA_ARGS__)
+#define f2fs_warn_ratelimited(sbi, fmt, ...)				\
+	f2fs_printk_ratelimited(sbi, KERN_WARNING fmt, ##__VA_ARGS__)
+#define f2fs_notice_ratelimited(sbi, fmt, ...)				\
+	f2fs_printk_ratelimited(sbi, KERN_NOTICE fmt, ##__VA_ARGS__)
+#define f2fs_info_ratelimited(sbi, fmt, ...)				\
+	f2fs_printk_ratelimited(sbi, KERN_INFO fmt, ##__VA_ARGS__)
+#define f2fs_debug_ratelimited(sbi, fmt, ...)				\
+	f2fs_printk_ratelimited(sbi, KERN_DEBUG fmt, ##__VA_ARGS__)
+
 #ifdef CONFIG_F2FS_FAULT_INJECTION
-#define f2fs_show_injection_info(sbi, type)					\
-	printk_ratelimited("%sF2FS-fs (%s) : inject %s in %s of %pS\n",	\
-		KERN_INFO, sbi->sb->s_id,				\
-		f2fs_fault_name[type],					\
-		__func__, __builtin_return_address(0))
+#define f2fs_show_injection_info(sbi, type)				\
+	f2fs_info_ratelimited(sbi, "inject %s in %s of %pS\n",		\
+			      f2fs_fault_name[type],			\
+			      __func__, __builtin_return_address(0))
 static inline bool time_to_inject(struct f2fs_sb_info *sbi, int type)
 {
 	struct f2fs_fault_info *ffi = &F2FS_OPTION(sbi).fault_info;
@@ -2027,20 +2063,6 @@ static inline int inc_valid_block_count(struct f2fs_sb_info *sbi,
 	return -ENOSPC;
 }
 
-__printf(2, 3)
-void f2fs_printk(struct f2fs_sb_info *sbi, const char *fmt, ...);
-
-#define f2fs_err(sbi, fmt, ...)						\
-	f2fs_printk(sbi, KERN_ERR fmt, ##__VA_ARGS__)
-#define f2fs_warn(sbi, fmt, ...)					\
-	f2fs_printk(sbi, KERN_WARNING fmt, ##__VA_ARGS__)
-#define f2fs_notice(sbi, fmt, ...)					\
-	f2fs_printk(sbi, KERN_NOTICE fmt, ##__VA_ARGS__)
-#define f2fs_info(sbi, fmt, ...)					\
-	f2fs_printk(sbi, KERN_INFO fmt, ##__VA_ARGS__)
-#define f2fs_debug(sbi, fmt, ...)					\
-	f2fs_printk(sbi, KERN_DEBUG fmt, ##__VA_ARGS__)
-
 static inline void dec_valid_block_count(struct f2fs_sb_info *sbi,
 						struct inode *inode,
 						block_t count)
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index deca74cb17df..cf500ce90b95 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -1057,10 +1057,8 @@ static void __remove_discard_cmd(struct f2fs_sb_info *sbi,
 		dc->error = 0;
 
 	if (dc->error)
-		printk_ratelimited(
-			"%sF2FS-fs (%s): Issue discard(%u, %u, %u) failed, ret: %d",
-			KERN_INFO, sbi->sb->s_id,
-			dc->lstart, dc->start, dc->len, dc->error);
+		f2fs_info_ratelimited(sbi, "Issue discard(%u, %u, %u) failed, ret: %d\n",
+				      dc->lstart, dc->start, dc->len, dc->error);
 	__detach_discard_cmd(dcc, dc);
 }
 



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
