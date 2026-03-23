Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qJWLGJ4ZwWn5QQQAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 23 Mar 2026 11:44:46 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 990BE2F068F
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 23 Mar 2026 11:44:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hi6tv4akptEF0RkRrKpDKnPMxhvMtiszKIZqnOthSyU=; b=guFOa+wkM710SQvz0MH0Cxqt/H
	FgRW/Hi+AVUoln0OMZUMNSqgvx3DPYbjxbe5pNHg1f9N1BxJC7UAwJs92Ux5TL2MWb6Ja5pXTN6Gs
	xTI1dw/fQe2W90imbKYQLBI0kBbWncNI4tMc15Kq9jh23ia8jbUyIbyCvrC0KveBC9U4=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1w4clz-0000oS-Ku;
	Mon, 23 Mar 2026 10:44:39 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <geoo115@gmail.com>) id 1w4cly-0000oC-Q6
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 23 Mar 2026 10:44:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=t7kx18ZtDYXjvQFOa0TwuTMVPJdqvqJYrZ0DR3wfVxI=; b=OM9lrxr+1WF/1PFq5D/fD6qXnR
 gR+BikJEF617NswOsTtp1/WkjRPKrpyF6OjWlhFNXvKPXDhOuQM4nKokVH4QHAOjH6RVJ+XbaQqzB
 AYK3K5k30qjYvfu8Ervnf6zzhXkpBtXW815TGmF+BSzlnmgRrT7DD6O9H4489KTZfmdk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=t7kx18ZtDYXjvQFOa0TwuTMVPJdqvqJYrZ0DR3wfVxI=; b=CXxowlMDDJriyWIbhBh4MRMAOd
 4xNuiEXwc0VEXzJwpcZko7ZX8fGkgI89jM48YLu6V4AYS+9VUaVUIK5lvMg4kjUWpY2eVj4lmdrWS
 kLwPV8+g9jcjzLVKOQwt+88y/PWm4XVwO8Fl/Vf/SI6EARpO2tXyRIruIg3gaboVyoJc=;
Received: from mail-wr1-f46.google.com ([209.85.221.46])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1w4cly-0004y7-8q for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 23 Mar 2026 10:44:38 +0000
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-43b48ac2727so2492f8f.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 23 Mar 2026 03:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1774262667; x=1774867467; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=t7kx18ZtDYXjvQFOa0TwuTMVPJdqvqJYrZ0DR3wfVxI=;
 b=fOGh+femWOsFizbCTibea4rBZcr+Rq5UAc7wEUB4HA+E6A924tlgghIt/XN+guNn1D
 2qETir7CdpTZd7p46gcdnLHz2eIFc/PVrzsXFOyVfsPxTbPhzv21ID9W02JqoYb+WnJT
 1JvHoEo+YxW+aVOdu6c4NBcr9mTfelGNDERrePzkvgFR4eCIQ7i5S7/0XDZOUaNwB7b8
 fhWGD0MlcdoaL78Pl/8/S1/ZICi22dAlCSzkWZd5CHFESv+xj+/Ki1C7Ari0Oi82JDUw
 a1Rm7FzDoag8JLD+AFz2ZgIURDVpQB/dS+cYA5BtAoEisIyKxCL/zHNVh1NPSkZFWgUX
 QUCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774262667; x=1774867467;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=t7kx18ZtDYXjvQFOa0TwuTMVPJdqvqJYrZ0DR3wfVxI=;
 b=WrWZvaJV7JRjwAHRZ2iSahrjfn3EMl91AW7dRhfLXkHX2CDS84kZXZ0KWIGhB7QHOi
 62JJv2frW+v6cwrfEHQd/N10qUNJ10cCm8jDEiLRo0P5DTIpGOwxqSW21rCIaZX86hBI
 7X+mK2waKfMU71qsibwU3GV3JbmA1gkZtVbqARIuAXGftUGvglJPVd+U9dxWIiMDB34/
 uJU8JQ4hIHVOrCTzm6Bn4QnTMHiSCcOeYVEKNUjwQcRczXDneEgMtPZ96G9OrGDL49BU
 bnKn8RuisedrDrUZbHWbzfcdqIqRSdVdGVHLzZmbyhsMldLkEKuIcFTXH/Z3a40wtbFe
 9Jww==
X-Forwarded-Encrypted: i=1;
 AJvYcCUw61i+trKyblV6uqW2h+NibYwrQ12DNwubcmNriTsjd2Mk7OVn9lSdmHmnYnVeAc2HwRsmhUw/zzryDjcWCFDZ@lists.sourceforge.net
X-Gm-Message-State: AOJu0YwkiVhSmj5rmKcievRXxEa9OLqon36inWaB71oePWNa6EBUJFlz
 5woQd/a2reGTHmQWgbcAQN9ajqm9f8Z37wYTUP0588Bsj/QlIa+rs4Wh
X-Gm-Gg: ATEYQzw7yW+9bt/KodRFGFsQY2q4L9kvonjngRBM2ZxGNEnJCnNxvlnq8kf780vgwk1
 lr4E3byo3ZAw5kZdORKo66cHrKzflSjxDjBzSZEDOXPGcZ25QXhUkaHU5hrnn71h51bvgmj5PV6
 S9yRMuXBNE8GODomW602swIYhkJMYOa9kfyC8wRrPMkdo925X8r9v2sunJEwlnCuPfzQW9Y8BWi
 35oCJDDkX/drd1t6+mH9z3XMIZV/qEn9dIFwEQMVJ6CJs5r5sr6rCSacyzc74FudWpx8SH/kohp
 lT+w9auiAOwnyaygSJDAzXulETi3sJztjtB7zbEz+tpuV+M0X11YZgy7A/tQayHY+J+pu3vbrHD
 elB6bBig7gL4FaR1vKoXxXGH6chm6LUCvqz0uVOlzmjc9oL9ad0NKJu+Na2JrW7d/vMjAC2OIzE
 FPBLbrshbbI9Gg/x2mGoz4gVZp3enLTRt48Gw1qYURJBMzn23vmnFsdNIDdYg85T6IShYri7wjl
 7CQqc0sm5kVBV9zfq6z6Ip0w9AnskIS9A==
X-Received: by 2002:a05:6000:250e:b0:43b:498f:dcfb with SMTP id
 ffacd0b85a97d-43b64242f3amr20505189f8f.8.1774262666467; 
 Mon, 23 Mar 2026 03:44:26 -0700 (PDT)
Received: from fedora.communityfibre.co.uk
 ([2a02:6b6f:fb26:6400:da6:2a24:3e4a:d588])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43b644bd0dcsm27420281f8f.11.2026.03.23.03.44.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Mar 2026 03:44:25 -0700 (PDT)
From: George Saad <geoo115@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Date: Mon, 23 Mar 2026 10:44:25 +0000
Message-ID: <20260323104425.780693-1-geoo115@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <2026032354-country-saddlebag-5331@gregkh>
References: <2026032354-country-saddlebag-5331@gregkh>
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  In f2fs_compress_write_end_io(), dec_page_count(sbi, type)
 at line 1492 can bring the F2FS_WB_CP_DATA counter to zero,
 unblocking f2fs_wait_on_all_pages()
 in f2fs_put_super() on a concurrent unmount C [...] 
 Content analysis details:   (0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.46 listed in wl.mailspike.net]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [geoo115(at)gmail.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit [geoo115(at)gmail.com]
X-Headers-End: 1w4cly-0004y7-8q
Subject: [f2fs-dev] [PATCH v3] f2fs: fix use-after-free of sbi in
 f2fs_compress_write_end_io()
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, George Saad <geoo115@gmail.com>,
 stable@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-0.01 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:gregkh@linuxfoundation.org,m:jaegeuk@kernel.org,m:geoo115@gmail.com,m:stable@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[geoo115@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,gmail.com:s=20230601];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,gmail.com:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geoo115@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org,lists.sourceforge.net];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5]
X-Rspamd-Queue-Id: 990BE2F068F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

In f2fs_compress_write_end_io(), dec_page_count(sbi, type) at line 1492
can bring the F2FS_WB_CP_DATA counter to zero, unblocking
f2fs_wait_on_all_pages() in f2fs_put_super() on a concurrent unmount
CPU. The unmount path then proceeds to call
f2fs_destroy_page_array_cache(sbi) and kfree(sbi). Meanwhile, the bio
completion callback is still executing: when it reaches
page_array_free(sbi, ...), it dereferences sbi->page_array_slab_size
and sbi->page_array_slab within the now-freed f2fs_sb_info structure.

This is the same class of bug as CVE-2026-23234 (which fixed the
equivalent race in f2fs_write_end_io() in data.c), but in the
compressed writeback completion path that was not covered by that fix.

Fix this by caching sbi->page_array_slab and sbi->page_array_slab_size
into local variables at function entry, before dec_page_count(). At
function entry, sbi is guaranteed valid because the F2FS_WB_CP_DATA
counter is still nonzero (this invocation has not yet decremented it),
preventing the unmount path from proceeding past
f2fs_wait_on_all_pages(). The cached values are then used in place of
the post-decrement sbi dereference.

Fixes: 4c8ff7095bef ("f2fs: support data compression")
Cc: stable@vger.kernel.org
Signed-off-by: George Saad <geoo115@gmail.com>
---
Changes in v3:
- Add Cc: stable@vger.kernel.org for backport to affected stable kernels

Changes in v2:
- Fix Fixes: tag commit hash (4c8ff7095bef, verified in Linus's tree)

 fs/f2fs/compress.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index 7b68bf229..c3d837df3 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -1479,11 +1479,20 @@ void f2fs_compress_write_end_io(struct bio *bio, struct folio *folio)
 {
 	struct page *page = &folio->page;
 	struct f2fs_sb_info *sbi = bio->bi_private;
+	struct kmem_cache *pa_slab = sbi->page_array_slab;
+	unsigned int pa_slab_size = sbi->page_array_slab_size;
 	struct compress_io_ctx *cic = folio->private;
 	enum count_type type = WB_DATA_TYPE(folio,
 				f2fs_is_compressed_page(folio));
 	int i;
 
+	/*
+	 * Cache sbi fields before dec_page_count(), which may unblock
+	 * f2fs_wait_on_all_pages() in the unmount path, allowing
+	 * f2fs_put_super() to free sbi.  At this point sbi is still
+	 * valid because the F2FS_WB_CP_DATA counter is nonzero.
+	 */
+
 	if (unlikely(bio->bi_status != BLK_STS_OK))
 		mapping_set_error(cic->inode->i_mapping, -EIO);
 
@@ -1500,7 +1509,10 @@ void f2fs_compress_write_end_io(struct bio *bio, struct folio *folio)
 		end_page_writeback(cic->rpages[i]);
 	}
 
-	page_array_free(sbi, cic->rpages, cic->nr_rpages);
+	if (likely(sizeof(struct page *) * cic->nr_rpages <= pa_slab_size))
+		kmem_cache_free(pa_slab, cic->rpages);
+	else
+		kfree(cic->rpages);
 	kmem_cache_free(cic_entry_slab, cic);
 }
 
-- 
2.53.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
