Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D3DE3B24591
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 13 Aug 2025 11:38:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-Id:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cHQWPVuvfUkzRB3PgCWzr8bbqb/36todTmW3bXJZEOw=; b=TXYPEQZE+ZJQlfp+jAVybUzPmY
	4ZkLibI36vKaSfZ0wKTa14w0Um1JqnNOz9ORKP5HBBfl/BoHUK+5WiJ9KvrzbJD+2vg30tXLDl7+2
	N7IBYsR+h1whbOihNYIEwRk1oGCUSWH/aL9YJ8kk44CAFsRJd9/7VNei51+8Boe2/Nk0=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1um7wZ-0000Xq-8I;
	Wed, 13 Aug 2025 09:38:51 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <nzzhao@126.com>) id 1um7wX-0000Xj-GE
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 13 Aug 2025 09:38:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bONKsUC7ZrwOatI+C3p8fv5cu28QuxUoAhI9QsXEo/Q=; b=m4zZD6Xm95bulcuMwTXiTA3Aws
 vLNmUcjh2OXbOBIn5kxwnT2a/LY6HAqmsFlD3w8srxjRHtmArdsnQ3cN9YO3+KH89EdU5oj/XFQgb
 Ymp1KRPwiI5uW/24m9yp5cSA+iqwW+hnt4D6K2/cfRJRr8Ybu6RPcvXfm+PfBCZp1Efw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bONKsUC7ZrwOatI+C3p8fv5cu28QuxUoAhI9QsXEo/Q=; b=Kg46jpwiBKUgZxzAdehzpY5Bui
 pUyBObbo85mF0/EOYesphpCw2wqF6Ne9FMyQhOSfuAAyd7TNe7n65YQq4/5enPbgBMwmZMIOjSbz6
 e7YzOijMi+uMG4gi2h2Be3vR1CpL7Nna9SPT4WNU9qWqCOmM8yLxhR3owrpVK2EIylE8=;
Received: from m16.mail.126.com ([117.135.210.6])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1um7wU-0004Uf-MC for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 13 Aug 2025 09:38:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=bO
 NKsUC7ZrwOatI+C3p8fv5cu28QuxUoAhI9QsXEo/Q=; b=BKf0/QlOsu/D4kuwsc
 9H6ksDtavdGeTxPefWpcM7CL75Uql0QMB7cJ7e09jshJlEKTHaeOVffPtnelzHmt
 D2VgSBFolHNNK1KzByOMoK6jW5rx7EZpz5aHEoq3TZokqyCQ6wv2l262hiQjFxq8
 YmHhA9e94pznjDfUv9zUQFQro=
Received: from YLLaptop.. (unknown [])
 by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id
 _____wD3tyv8XJxo_MzyBQ--.54250S4; 
 Wed, 13 Aug 2025 17:38:22 +0800 (CST)
From: Nanzhe Zhao <nzzhao@126.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-f2fs-devel@lists.sourceforge.net,
 linux-fsdevel@vger.kernel.org
Date: Wed, 13 Aug 2025 17:37:48 +0800
Message-Id: <20250813093755.47599-3-nzzhao@126.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250813093755.47599-1-nzzhao@126.com>
References: <20250813093755.47599-1-nzzhao@126.com>
MIME-Version: 1.0
X-CM-TRANSID: _____wD3tyv8XJxo_MzyBQ--.54250S4
X-Coremail-Antispam: 1Uf129KBjvAXoW3KFWrKrW3GFW5Zw4fuF1Utrb_yoW8Jr4fto
 WFgr42g3W8ur43JrW2kr1UXa4DZF1Yyr1xtF93ZF4kZFnrAasrWFW29r4DJa4xCr15GFy7
 Zan7Xa12kFW3X3Wxn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
 AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUjWlkDUUUU
X-Originating-IP: [58.240.165.118]
X-CM-SenderInfo: xq22xtbr6rjloofrz/1tbiEwOoz2icVjth3AAAsT
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Integrate f2fs_iomap_folio_state into the f2fs page private
 helper functions. In these functions, we adopt a two-stage strategy to handle
 the folio->private field, now supporting both direct bit flags and the new
 f2fs_iomap_folio_state pointer. 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [117.135.210.6 listed in wl.mailspike.net]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [nzzhao(at)126.com]
 0.0 UNPARSEABLE_RELAY Informational: message has unparseable relay lines
X-Headers-End: 1um7wU-0004Uf-MC
Subject: [f2fs-dev] [RFC PATCH 2/9] f2fs: Integrate f2fs_iomap_folio_state
 into f2fs page private helpers
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
Cc: Nanzhe Zhao <nzzhao@126.com>, Barry Song <21cnbao@gmail.com>,
 Matthew Wilcox <willy@infradead.org>, Yi Zhang <yi.zhang@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Integrate f2fs_iomap_folio_state into the f2fs page private helper
functions.

In these functions, we adopt a two-stage strategy to handle the
folio->private field, now supporting both direct bit flags and the
new f2fs_iomap_folio_state pointer.

Note that my implementation does not rely on checking the folio's
order to distinguish whether the folio's private field stores
a flag or an f2fs_iomap_folio_state.
This is because in the folio_set_f2fs_xxx
functions, we will forcibly allocate an f2fs_iomap_folio_state
struct even for order-0 folios under certain conditions.

The reason for doing this is that if an order-0 folio's private field
is set to an f2fs private flag by a thread like gc, the generic
iomap_folio_state helper functions used in iomap buffered write will
mistakenly interpret it as an iomap_folio_state pointer.
We cannot, or rather should not, modify fs/iomap to make it recognize
f2fs's private flags.
Therefore, for now, I have to uniformly allocate an
f2fs_iomap_folio_state for all folios that will need to store an
f2fs private flag to ensure correctness.

I am also thinking about other ways to eliminate the extra memory
overhead this approach introduces. Suggestions would be grateful.

Signed-off-by: Nanzhe Zhao <nzzhao@126.com>
---
 fs/f2fs/f2fs.h | 278 +++++++++++++++++++++++++++++++++++++++----------
 1 file changed, 225 insertions(+), 53 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 8df0443dd189..a14bef4dc394 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -27,7 +27,10 @@
 
 #include <linux/fscrypt.h>
 #include <linux/fsverity.h>
-
+#include <linux/iomap.h>
+#ifdef CONFIG_F2FS_IOMAP_FOLIO_STATE
+#include "f2fs_ifs.h"
+#endif
 struct pagevec;
 
 #ifdef CONFIG_F2FS_CHECK_FS
@@ -2509,58 +2512,227 @@ static inline int inc_valid_block_count(struct f2fs_sb_info *sbi,
 	return -ENOSPC;
 }
 
-#define PAGE_PRIVATE_GET_FUNC(name, flagname) \
-static inline bool folio_test_f2fs_##name(const struct folio *folio)	\
-{									\
-	unsigned long priv = (unsigned long)folio->private;		\
-	unsigned long v = (1UL << PAGE_PRIVATE_NOT_POINTER) |		\
-			     (1UL << PAGE_PRIVATE_##flagname);		\
-	return (priv & v) == v;						\
-}									\
-static inline bool page_private_##name(struct page *page) \
-{ \
-	return PagePrivate(page) && \
-		test_bit(PAGE_PRIVATE_NOT_POINTER, &page_private(page)) && \
-		test_bit(PAGE_PRIVATE_##flagname, &page_private(page)); \
-}
-
-#define PAGE_PRIVATE_SET_FUNC(name, flagname) \
-static inline void folio_set_f2fs_##name(struct folio *folio)		\
-{									\
-	unsigned long v = (1UL << PAGE_PRIVATE_NOT_POINTER) |		\
-			     (1UL << PAGE_PRIVATE_##flagname);		\
-	if (!folio->private)						\
-		folio_attach_private(folio, (void *)v);			\
-	else {								\
-		v |= (unsigned long)folio->private;			\
-		folio->private = (void *)v;				\
-	}								\
-}									\
-static inline void set_page_private_##name(struct page *page) \
-{ \
-	if (!PagePrivate(page)) \
-		attach_page_private(page, (void *)0); \
-	set_bit(PAGE_PRIVATE_NOT_POINTER, &page_private(page)); \
-	set_bit(PAGE_PRIVATE_##flagname, &page_private(page)); \
-}
-
-#define PAGE_PRIVATE_CLEAR_FUNC(name, flagname) \
-static inline void folio_clear_f2fs_##name(struct folio *folio)		\
-{									\
-	unsigned long v = (unsigned long)folio->private;		\
-									\
-	v &= ~(1UL << PAGE_PRIVATE_##flagname);				\
-	if (v == (1UL << PAGE_PRIVATE_NOT_POINTER))			\
-		folio_detach_private(folio);				\
-	else								\
-		folio->private = (void *)v;				\
-}									\
-static inline void clear_page_private_##name(struct page *page) \
-{ \
-	clear_bit(PAGE_PRIVATE_##flagname, &page_private(page)); \
-	if (page_private(page) == BIT(PAGE_PRIVATE_NOT_POINTER)) \
-		detach_page_private(page); \
+extern bool f2fs_should_use_buffered_iomap(struct inode *inode);
+#ifdef CONFIG_F2FS_IOMAP_FOLIO_STATE
+#define F2FS_FOLIO_PRIVATE_GET_FUNC(name, flagname)                            \
+	static inline bool folio_test_f2fs_##name(const struct folio *folio)   \
+	{                                                                      \
+		/* First try direct folio->private access for meta folio */    \
+		if (folio_test_private(folio) &&                               \
+		    test_bit(PAGE_PRIVATE_NOT_POINTER,                         \
+			     (unsigned long *)&folio->private)) {              \
+			return test_bit(PAGE_PRIVATE_##flagname,               \
+					(unsigned long *)&folio->private);     \
+		}                                                              \
+		/* For higher-order folios, use iomap folio state */           \
+		struct f2fs_iomap_folio_state *fifs =                          \
+			(struct f2fs_iomap_folio_state *)folio->private;       \
+		unsigned long *private_p;                                      \
+		if (unlikely(!fifs || !folio->mapping))                        \
+			return false;                                          \
+		/* Check magic number before accessing private data */         \
+		if (READ_ONCE(fifs->read_bytes_pending) != F2FS_IFS_MAGIC)     \
+			return false;                                          \
+		private_p = f2fs_ifs_private_flags_ptr(fifs, folio);           \
+		if (!private_p)                                                \
+			return false;                                          \
+		/* Test bits directly on the 'private' slot */                 \
+		return test_bit(PAGE_PRIVATE_##flagname, private_p);           \
+	}                                                                      \
+	static inline bool page_private_##name(struct page *page)              \
+	{                                                                      \
+		return PagePrivate(page) &&                                    \
+		       test_bit(PAGE_PRIVATE_NOT_POINTER,                      \
+				&page_private(page)) &&                        \
+		       test_bit(PAGE_PRIVATE_##flagname, &page_private(page)); \
+	}
+#define F2FS_FOLIO_PRIVATE_SET_FUNC(name, flagname)                              \
+	static inline int folio_set_f2fs_##name(struct folio *folio)             \
+	{                                                                        \
+		/* For higher-order folios, use iomap folio state */             \
+		if (unlikely(!folio->mapping))                                   \
+			return -ENOENT;                                          \
+		bool force_alloc =                                               \
+			f2fs_should_use_buffered_iomap(folio_inode(folio));      \
+		if (!force_alloc && !folio_test_private(folio)) {                \
+			folio_attach_private(folio, (void *)0);                  \
+			set_bit(PAGE_PRIVATE_NOT_POINTER,                        \
+				(unsigned long *)&folio->private);               \
+			set_bit(PAGE_PRIVATE_##flagname,                         \
+				(unsigned long *)&folio->private);               \
+			return 0;                                                \
+		}                                                                \
+		struct f2fs_iomap_folio_state *fifs =                            \
+			f2fs_ifs_alloc(folio, GFP_NOFS, true);                   \
+		if (unlikely(!fifs))                                             \
+			return -ENOMEM;                                          \
+		unsigned long *private_p;                                        \
+		WRITE_ONCE(fifs->read_bytes_pending, F2FS_IFS_MAGIC);            \
+		private_p = f2fs_ifs_private_flags_ptr(fifs, folio);             \
+		if (!private_p)                                                  \
+			return -EINVAL;                                          \
+		/* Set the bit atomically */                                     \
+		set_bit(PAGE_PRIVATE_##flagname, private_p);                     \
+		/* Ensure NOT_POINTER bit is also set if any F2FS flag is set */ \
+		if (PAGE_PRIVATE_##flagname != PAGE_PRIVATE_NOT_POINTER)         \
+			set_bit(PAGE_PRIVATE_NOT_POINTER, private_p);            \
+		return 0;                                                        \
+	}                                                                        \
+	static inline void set_page_private_##name(struct page *page)            \
+	{                                                                        \
+		if (!PagePrivate(page))                                          \
+			attach_page_private(page, (void *)0);                    \
+		set_bit(PAGE_PRIVATE_NOT_POINTER, &page_private(page));          \
+		set_bit(PAGE_PRIVATE_##flagname, &page_private(page));           \
+	}
+
+#define F2FS_FOLIO_PRIVATE_CLEAR_FUNC(name, flagname)                      \
+	static inline void folio_clear_f2fs_##name(struct folio *folio)    \
+	{                                                                  \
+		/* First try direct folio->private access */               \
+		if (folio_test_private(folio) &&                           \
+		    test_bit(PAGE_PRIVATE_NOT_POINTER,                     \
+			     (unsigned long *)&folio->private)) {          \
+			clear_bit(PAGE_PRIVATE_##flagname,                 \
+				  (unsigned long *)&folio->private);       \
+			folio_detach_private(folio);                       \
+			return;                                            \
+		}                                                          \
+		/* For higher-order folios, use iomap folio state */       \
+		struct f2fs_iomap_folio_state *fifs =                      \
+			(struct f2fs_iomap_folio_state *)folio->private;   \
+		unsigned long *private_p;                                  \
+		if (unlikely(!fifs || !folio->mapping))                    \
+			return;                                            \
+		/* Check magic number before clearing */                   \
+		if (READ_ONCE(fifs->read_bytes_pending) != F2FS_IFS_MAGIC) \
+			return; /* Not ours or state unclear */            \
+		private_p = f2fs_ifs_private_flags_ptr(fifs, folio);       \
+		if (!private_p)                                            \
+			return;                                            \
+		clear_bit(PAGE_PRIVATE_##flagname, private_p);             \
+	}                                                                  \
+	static inline void clear_page_private_##name(struct page *page)    \
+	{                                                                  \
+		clear_bit(PAGE_PRIVATE_##flagname, &page_private(page));   \
+		if (page_private(page) == BIT(PAGE_PRIVATE_NOT_POINTER))   \
+			detach_page_private(page);                         \
+	}
+// Generate the accessor functions using the macros
+F2FS_FOLIO_PRIVATE_GET_FUNC(nonpointer, NOT_POINTER);
+F2FS_FOLIO_PRIVATE_GET_FUNC(inline, INLINE_INODE);
+F2FS_FOLIO_PRIVATE_GET_FUNC(gcing, ONGOING_MIGRATION);
+F2FS_FOLIO_PRIVATE_GET_FUNC(atomic, ATOMIC_WRITE);
+F2FS_FOLIO_PRIVATE_GET_FUNC(reference, REF_RESOURCE);
+
+F2FS_FOLIO_PRIVATE_SET_FUNC(reference, REF_RESOURCE);
+F2FS_FOLIO_PRIVATE_SET_FUNC(inline, INLINE_INODE);
+F2FS_FOLIO_PRIVATE_SET_FUNC(gcing, ONGOING_MIGRATION);
+F2FS_FOLIO_PRIVATE_SET_FUNC(atomic, ATOMIC_WRITE);
+
+F2FS_FOLIO_PRIVATE_CLEAR_FUNC(reference, REF_RESOURCE);
+F2FS_FOLIO_PRIVATE_CLEAR_FUNC(inline, INLINE_INODE);
+F2FS_FOLIO_PRIVATE_CLEAR_FUNC(gcing, ONGOING_MIGRATION);
+F2FS_FOLIO_PRIVATE_CLEAR_FUNC(atomic, ATOMIC_WRITE);
+static inline int folio_set_f2fs_data(struct folio *folio, unsigned long data)
+{
+	if (unlikely(!folio->mapping))
+		return -ENOENT;
+
+	struct f2fs_iomap_folio_state *fifs =
+		f2fs_ifs_alloc(folio, GFP_NOFS, true);
+	if (unlikely(!fifs))
+		return -ENOMEM;
+
+	unsigned long *private_p;
+
+	private_p = f2fs_ifs_private_flags_ptr(fifs, folio);
+	if (!private_p)
+		return -EINVAL;
+
+	*private_p &= GENMASK(PAGE_PRIVATE_MAX - 1, 0);
+	*private_p |= (data << PAGE_PRIVATE_MAX);
+	set_bit(PAGE_PRIVATE_NOT_POINTER, private_p);
+
+	return 0;
 }
+static inline unsigned long folio_get_f2fs_data(struct folio *folio)
+{
+	struct f2fs_iomap_folio_state *fifs =
+		(struct f2fs_iomap_folio_state *)folio->private;
+	unsigned long *private_p;
+	unsigned long data_val;
+
+	if (!folio->mapping)
+		return 0;
+	f2fs_bug_on(F2FS_I_SB(folio_inode(folio)), !fifs);
+	if (READ_ONCE(fifs->read_bytes_pending) != F2FS_IFS_MAGIC)
+		return 0;
+
+	private_p = f2fs_ifs_private_flags_ptr(fifs, folio);
+	if (!private_p)
+		return 0;
+
+	data_val = READ_ONCE(*private_p);
+
+	if (!test_bit(PAGE_PRIVATE_NOT_POINTER, &data_val))
+		return 0;
+
+	return data_val >> PAGE_PRIVATE_MAX;
+}
+#else
+#define PAGE_PRIVATE_GET_FUNC(name, flagname)                                  \
+	static inline bool folio_test_f2fs_##name(const struct folio *folio)   \
+	{                                                                      \
+		unsigned long priv = (unsigned long)folio->private;            \
+		unsigned long v = (1UL << PAGE_PRIVATE_NOT_POINTER) |          \
+				  (1UL << PAGE_PRIVATE_##flagname);            \
+		return (priv & v) == v;                                        \
+	}                                                                      \
+	static inline bool page_private_##name(struct page *page)              \
+	{                                                                      \
+		return PagePrivate(page) &&                                    \
+		       test_bit(PAGE_PRIVATE_NOT_POINTER,                      \
+				&page_private(page)) &&                        \
+		       test_bit(PAGE_PRIVATE_##flagname, &page_private(page)); \
+	}
+
+#define PAGE_PRIVATE_SET_FUNC(name, flagname)                           \
+	static inline void folio_set_f2fs_##name(struct folio *folio)   \
+	{                                                               \
+		unsigned long v = (1UL << PAGE_PRIVATE_NOT_POINTER) |   \
+				  (1UL << PAGE_PRIVATE_##flagname);     \
+		if (!folio->private)                                    \
+			folio_attach_private(folio, (void *)v);         \
+		else {                                                  \
+			v |= (unsigned long)folio->private;             \
+			folio->private = (void *)v;                     \
+		}                                                       \
+	}                                                               \
+	static inline void set_page_private_##name(struct page *page)   \
+	{                                                               \
+		if (!PagePrivate(page))                                 \
+			attach_page_private(page, (void *)0);           \
+		set_bit(PAGE_PRIVATE_NOT_POINTER, &page_private(page)); \
+		set_bit(PAGE_PRIVATE_##flagname, &page_private(page));  \
+	}
+
+#define PAGE_PRIVATE_CLEAR_FUNC(name, flagname)                          \
+	static inline void folio_clear_f2fs_##name(struct folio *folio)  \
+	{                                                                \
+		unsigned long v = (unsigned long)folio->private;         \
+		v &= ~(1UL << PAGE_PRIVATE_##flagname);                  \
+		if (v == (1UL << PAGE_PRIVATE_NOT_POINTER))              \
+			folio_detach_private(folio);                     \
+		else                                                     \
+			folio->private = (void *)v;                      \
+	}                                                                \
+	static inline void clear_page_private_##name(struct page *page)  \
+	{                                                                \
+		clear_bit(PAGE_PRIVATE_##flagname, &page_private(page)); \
+		if (page_private(page) == BIT(PAGE_PRIVATE_NOT_POINTER)) \
+			detach_page_private(page);                       \
+	}
 
 PAGE_PRIVATE_GET_FUNC(nonpointer, NOT_POINTER);
 PAGE_PRIVATE_GET_FUNC(inline, INLINE_INODE);
@@ -2595,7 +2767,7 @@ static inline void folio_set_f2fs_data(struct folio *folio, unsigned long data)
 	else
 		folio->private = (void *)((unsigned long)folio->private | data);
 }
-
+#endif
 static inline void dec_valid_block_count(struct f2fs_sb_info *sbi,
 						struct inode *inode,
 						block_t count)
-- 
2.34.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
