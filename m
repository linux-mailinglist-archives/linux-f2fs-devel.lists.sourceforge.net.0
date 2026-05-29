Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WK11IPZUGWrTvQgAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 29 May 2026 10:57:26 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E41565FF9AC
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 29 May 2026 10:57:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1ncvNsPT70eFvZPUeokgF/2+TKJ0CXEzQXen55pNA6Q=; b=HkzltWrTPDSghciMaG8roJExqs
	YnbY8sv4KxcP0F9iyjR3uzoxwd08O4yQ4iTgCEIf5ntc6erm2lXStBuK1um7LCfXYyOV19w7MGwoL
	jJX6Gv26R/sHisu56jM+/O3T4Fl3UVoNiKmworYqTo+QobcIvCGyap0TurgvjwkoGG+w=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wSt1u-0007Et-Ls;
	Fri, 29 May 2026 08:57:23 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yangyongpeng.storage@gmail.com>) id 1wSt1t-0007Ef-CH
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 29 May 2026 08:57:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QxzCt3HpAqcxgyjUqMGSfyFl9cavpbZfeNlqdDG004I=; b=kcQqaXmaEp/Dp+KyI6pCUVnt4q
 jS70Tx+MFcYh1Fxg83HDgA0ypq4yGzsw+tVbMnNNONj41rqyEbIxXAyjhw5pvFFGzcCjL2Tx7CrI8
 Fe2v7Ftkwszej1K5t5wHFM/nfsASXXT59MYzfEMivpu0QexRpvvsRFkNQ6VuY/yus9ag=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=QxzCt3HpAqcxgyjUqMGSfyFl9cavpbZfeNlqdDG004I=; b=cw5xBg/0XXmhStE14Sh6WAnkJL
 rG8DVUnEUPQcq9DA2+TMLKrMiaPN6cCzYoIbV62HiCNukbwKyv6vl5Ofwbwq5uUPCfRPUvHUI14O/
 4SAVCWjL6+4uFWjHyZBgdv2THofXqwRfDiK8qu+Hhp9/Gx5fAicbio+gTysblmyLVBs4=;
Received: from mail-pj1-f52.google.com ([209.85.216.52])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1wSt1X-00013n-Vy for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 29 May 2026 08:57:22 +0000
Received: by mail-pj1-f52.google.com with SMTP id
 98e67ed59e1d1-36b7b7b7a80so858696a91.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 29 May 2026 01:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1780045010; x=1780649810; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QxzCt3HpAqcxgyjUqMGSfyFl9cavpbZfeNlqdDG004I=;
 b=G5KVJL5pjAx5yURIWy5n/DQqv45E70xb6U+5viIpCGo0zXfxyNSwytx+4GjucPhHOt
 0uJzAVuh/sV8x0r/7MW2eg87nlzk6dY0eySRXibdmXJxrAWkoMk5rbXQY5xwifHOeqOk
 dHHBDRpEXV303KU6mn7cT/BwE3IGhzoNK7gY0jWToOkMw5zJevUUiLHioGUMrkCo9PjN
 +i2xEJPs3ocxJBT01XsSK0HSJn80zS2y3F9U7lEioHo+5OxHMIg2nr95Nw71IH3DX9sv
 TOqo6W0RWOY92ilxFmD6KGPudRsgtOpBOG17Zb8ZilPlyNqghc6DsnWmZMzZLsB9jqvh
 +aMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780045010; x=1780649810;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=QxzCt3HpAqcxgyjUqMGSfyFl9cavpbZfeNlqdDG004I=;
 b=qzavVss+PdfIgVaoyC0uOb7vW3NpEzC//OvFvg+gexAc64b2vDrGXx2FinVPlbpujX
 dEzzga1PN8xKM7gPN8ZzDI85GxPEitn+D/udJ5i/kYMySdncSvXz4rE0YntJbomUu41S
 pLtAYCYK885ezKqr6wUO2XB4zuebFO2qj2XKAZOUpYMSaNM8Me4c6D2P3RfDOUxpD7BC
 Mvhq57m0EiF1x3D8/qHceaFAn8cDUpOFAIzAjAmBHgOOXAKiDr0Gmh70x7Eek+iMwPzg
 h8E+sQ2tJb6rKL07RnAuBvBPi82i2lBE/Dnv6bNO6I+v207Ao3qp4WkN+xBtKp7M03Tt
 k2Cg==
X-Gm-Message-State: AOJu0YzaMjvMGGJkUnPxDInXxBy9NkPJQCAPQk0lctO3HpzSWRAc5Nhr
 CMlAXX57IVvKx8ruT20E5MIgljvzj1JSGgPeDp35rUsAWy66cF6oGEYe
X-Gm-Gg: Acq92OFAT7Ds+CZov8MSY73j9AaDz5qOivzwyRgzR9clRNKIZoL4n7ldEJYjWHjgGmc
 lGo5LHP4/4tk4ZCZV4aU5YD6mywX6uuci5fUsumR+aqlOVXJ1t6RjCSi0c7aVkRhMKJ2OoeinCx
 d6WXl775dA19H8/60NNf4lKShtHQI8dbp0xOm0blVZv9sVFFi9aN8qG8tKvqdTt5PdfcsOqAtib
 Prh50lYQ9x/ACOFNCFQg/hNc7OokT/rohL/UlbI9s8NXkVyI+27V+ei0MUwv4cQcQ79K+1YLF+k
 d4NqxfuKA1fCJnIEmR177BpuZw4foATHnQ4LbARrx5hyCy74QpBKl/BZnS+Xxq0OETC7vDI7/Hd
 +78ofgNmVSaYCKCajfKswNfJmqjVVq7AV9rhButOAFDQ43DKFCa1ogQ4tgfhUsxLh5i/H1e4FWW
 E3s+pbJen+8uRHR2CvSD+qNuElA2giQp5XWbnd7vwxuBjcRpwgTYMj2hD2d97Sj5XnbLIPdFhHa
 iVKuWAn
X-Received: by 2002:a17:90b:5746:b0:35f:c493:cac5 with SMTP id
 98e67ed59e1d1-36bbe1c11f0mr2056855a91.16.1780045009569; 
 Fri, 29 May 2026 01:56:49 -0700 (PDT)
Received: from xiaomi-ThinkCentre-M760t.mioffice.cn ([43.224.245.241])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-36bc1d9f2bbsm874027a91.2.2026.05.29.01.56.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2026 01:56:49 -0700 (PDT)
From: Yongpeng Yang <yangyongpeng.storage@gmail.com>
To: Chao Yu <chao@kernel.org>,
	Jaegeuk Kim <jaegeuk@kernel.org>
Date: Fri, 29 May 2026 16:56:27 +0800
Message-ID: <20260529085629.2664539-4-yangyongpeng.storage@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260529085629.2664539-1-yangyongpeng.storage@gmail.com>
References: <20260529085629.2664539-1-yangyongpeng.storage@gmail.com>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Yongpeng Yang Allow userspace to enable or disable
 inline
 extent format on a per-file basis through the FS_IOC_SETFLAGS/FS_IOC_GETFLAGS
 ioctl interface using the F2FS_EXTENT_FL flag. When setting the flag, the
 file's direct block addresses are converted to inline extent format.
 Compressed
 files are excluded from this conversion as the two features are mutually
 exclusive. Clearing [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.52 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [yangyongpeng.storage(at)gmail.com]
X-Headers-End: 1wSt1X-00013n-Vy
Subject: [f2fs-dev] [RFC PATCH v2 3/5] f2fs: support setting inline extent
 flag via ioctl
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
Cc: Yongpeng Yang <yangyongpeng@xiaomi.com>,
 Yongpeng Yang <monty_pavel@sina.com>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-1.01 / 15.00];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:chao@kernel.org,m:jaegeuk@kernel.org,m:yangyongpeng@xiaomi.com,m:monty_pavel@sina.com,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[yangyongpengstorage@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DKIM_MIXED(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	MIME_TRACE(0.00)[0:+];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,gmail.com:s=20251104];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,gmail.com:-];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yangyongpengstorage@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FREEMAIL_CC(0.00)[xiaomi.com,sina.com,lists.sourceforge.net];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:dkim,lists.sourceforge.net:rdns,lists.sourceforge.net:helo]
X-Rspamd-Queue-Id: E41565FF9AC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Yongpeng Yang <yangyongpeng@xiaomi.com>

Allow userspace to enable or disable inline extent format on a
per-file basis through the FS_IOC_SETFLAGS/FS_IOC_GETFLAGS ioctl
interface using the F2FS_EXTENT_FL flag.

When setting the flag, the file's direct block addresses are converted
to inline extent format. Compressed files are excluded from this
conversion as the two features are mutually exclusive. Clearing the
flag converts back to direct block format without restrictions.

Signed-off-by: Yongpeng Yang <yangyongpeng@xiaomi.com>
---
v2:
- Fix f2fs_iext_enable_inline_extent to use PTR_ERR(ifolio) instead of
  hardcoded -ENOMEM.
---
 fs/f2fs/file.c | 79 ++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 79 insertions(+)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 7db9cef5bc65..a20f332a2354 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -33,6 +33,7 @@
 #include "acl.h"
 #include "gc.h"
 #include "iostat.h"
+#include "iextent.h"
 #include <trace/events/f2fs.h>
 #include <uapi/linux/f2fs.h>
 
@@ -2117,6 +2118,58 @@ static int f2fs_file_flush(struct file *file, fl_owner_t id)
 	return 0;
 }
 
+#ifdef CONFIG_F2FS_INLINE_EXTENT
+static int f2fs_iext_enable_inline_extent(struct inode *inode)
+{
+	int ret = 0;
+	struct folio *ifolio = NULL;
+
+	if (f2fs_has_inline_data(inode))
+		goto out;
+
+	ret = filemap_write_and_wait(inode->i_mapping);
+	if (ret)
+		goto out;
+
+	ifolio = f2fs_get_inode_folio(F2FS_I_SB(inode), inode->i_ino);
+	if (IS_ERR(ifolio))
+		return PTR_ERR(ifolio);
+
+	if (!f2fs_iext_convert_to_inline_extent(inode, ifolio)) {
+		f2fs_folio_put(ifolio, true);
+		f2fs_err(F2FS_I_SB(inode), "convert to inline extent failed!");
+		ret = -EINVAL;
+		goto out;
+	}
+	folio_mark_dirty(ifolio);
+	f2fs_folio_put(ifolio, true);
+
+out:
+	return ret;
+}
+
+static int f2fs_iext_disable_inline_extent(struct inode *inode)
+{
+	struct folio *ifolio;
+	int ret;
+
+	ret = filemap_write_and_wait(inode->i_mapping);
+	if (ret)
+		return ret;
+
+	ifolio = f2fs_get_inode_folio(F2FS_I_SB(inode), inode->i_ino);
+	if (IS_ERR(ifolio))
+		return PTR_ERR(ifolio);
+	if (!f2fs_iext_support_inline_extent(inode, ifolio))
+		goto out;
+	f2fs_iext_convert_to_direct_blocks(inode, ifolio);
+	folio_mark_dirty(ifolio);
+out:
+	f2fs_folio_put(ifolio, true);
+	return 0;
+}
+#endif
+
 static int f2fs_setflags_common(struct inode *inode, u32 iflags, u32 mask)
 {
 	struct f2fs_inode_info *fi = F2FS_I(inode);
@@ -2129,6 +2182,30 @@ static int f2fs_setflags_common(struct inode *inode, u32 iflags, u32 mask)
 	if (IS_NOQUOTA(inode))
 		return -EPERM;
 
+#ifdef CONFIG_F2FS_INLINE_EXTENT
+	if (iflags & F2FS_EXTENT_FL) {
+		int ret;
+
+		if (!S_ISREG(inode->i_mode))
+			return -EOPNOTSUPP;
+		if (iflags & F2FS_COMPR_FL)
+			return -EOPNOTSUPP;
+		if (f2fs_compressed_file(inode))
+			return -EOPNOTSUPP;
+		ret = f2fs_iext_enable_inline_extent(inode);
+		if (ret)
+			return ret;
+	}
+	if ((iflags ^ masked_flags) & F2FS_EXTENT_FL) {
+		if (masked_flags & F2FS_EXTENT_FL) {
+			int ret = f2fs_iext_disable_inline_extent(inode);
+
+			if (ret)
+				return ret;
+		}
+	}
+#endif
+
 	if ((iflags ^ masked_flags) & F2FS_CASEFOLD_FL) {
 		if (!f2fs_sb_has_casefold(F2FS_I_SB(inode)))
 			return -EOPNOTSUPP;
@@ -2224,6 +2301,7 @@ static const struct {
 		FS_NOCOMP_FL |		\
 		FS_INDEX_FL |		\
 		FS_DIRSYNC_FL |		\
+		FS_EXTENT_FL |		\
 		FS_PROJINHERIT_FL |	\
 		FS_ENCRYPT_FL |		\
 		FS_INLINE_DATA_FL |	\
@@ -2240,6 +2318,7 @@ static const struct {
 		FS_NOATIME_FL |		\
 		FS_NOCOMP_FL |		\
 		FS_DIRSYNC_FL |		\
+		FS_EXTENT_FL |		\
 		FS_PROJINHERIT_FL |	\
 		FS_CASEFOLD_FL)
 
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
