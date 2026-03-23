Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sPBKLSIKwWmtPwQAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 23 Mar 2026 10:38:42 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EBFB32EF32A
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 23 Mar 2026 10:38:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0EuWruBYASO5lRDb3Iuw0Ch9VIOwYPs/F6plFJg/W6Q=; b=hlNfqcRPOM3S0z0MQ/4VbwpI3K
	kVuIuwwhWAYRQNAPVUJhAxEyr9/y00e+3sSFlYo89VG0JQqgKzBZdj+vlXYDcYquQkm8M8EM0Hh43
	X3KvMiQnVVOEWpWoJINw2fkuUtjI3kyQ1MVptF2fT4dryeUfq3rZXUK3WHFD1Lvglnu4=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1w4bk6-0005zH-RM;
	Mon, 23 Mar 2026 09:38:38 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <geoo115@gmail.com>) id 1w4bk4-0005zA-Rh
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 23 Mar 2026 09:38:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UOORmPEuUINhz5zFqlz+7ye0sSkzVe9ZM7W5/AKTfzg=; b=CsAKuCm81lUIwjT1QBx/l8ZtxP
 Zpjs7/Qzb1GfhDpqHTB2GLZPy73iGj6zNeZhFpsDvYMnZGoAU0n1vtCe/D61xVWKkUmKvtSfJDDEj
 fr1uPfLINTTkvK3I1RMfb7sGFrCR2e4A+D7Z4kQEtge3VfrRFJrHC+bU1bSe9TnI003g=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=UOORmPEuUINhz5zFqlz+7ye0sSkzVe9ZM7W5/AKTfzg=; b=jqZq610Mc/FthNZhjI58Kp4z/W
 osCsgjp5zE0glhWG3BMPZ/mwPDTq6aT+BTPRp6md2kAR7wNI6+PUxMLPZn5flsxfuGsoeAsStqEE8
 +xQUwsDrvNugSNJF8Szx3I6TfPjkBdramk93p9DgCgG24BYVGMIJZiW7yi0ACL1BRoak=;
Received: from mail-wm1-f48.google.com ([209.85.128.48])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1w4bk4-0000px-Av for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 23 Mar 2026 09:38:36 +0000
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-48557c8ad47so28830265e9.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 23 Mar 2026 02:38:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1774258710; x=1774863510; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UOORmPEuUINhz5zFqlz+7ye0sSkzVe9ZM7W5/AKTfzg=;
 b=Y7u7auHSbP0GPu/XJ4RFybVbNmiRfA8PuB1/kkCaXe8QvjvpA0ngS4wZqcecpty8w1
 tEBDbsG4LWsR47Po7GIKoLVXQs/JMpIufTpKeaCaoPdF8JHZ225vF4Iy5QNK5Bd/4Tee
 Y7GGAhb6hGldsbmBLEcoUVZSKJcCc1okbLQQP1Bpo5z0uY0GbOJTXD4fB6SmTrmvkVYk
 WxBPdoyICqeO92aQwLYW35wVcWPquhW9u7eLkzAmkBSJnNCp2FTAkYV89LU1ZVMPwUUV
 SL9r8b9TTWEIaDogFAa89tcajqrA5pz55r/fsJm7XQ55mu+DDqCIf0ddADGAJvZniItP
 mamA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774258710; x=1774863510;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=UOORmPEuUINhz5zFqlz+7ye0sSkzVe9ZM7W5/AKTfzg=;
 b=TpbZ7k441FYi8HSRLN2ywfBC5huTbaU7eTGyscUHehs/laHjem4Dl3JCEWjMw+pw4J
 OdYqr9IELsZDUQX1ELwKsq1nPJCVVJSNfS5Mdi+NTVBm8xMCxM6Emcm5ohRkRTQfPwBy
 DsncCROSt3lQAaXKw/cc+XkFmq4W9eoa6JYpPZiYL3xqMowPhP2FqufflWDA9GfP/Tpc
 XMaQWICgzmry5ro2Jm8bvUeH9Q1wRcSu+Kd6PKmZRqjDZSJKiwOtdDBCDft/Q1VR/Fi9
 72SkSHduaRuVmEBgqsNEKeQzrFOvOQxTwu/C1JH62INgRPZSAKeeJC8hg+XSjLSNKFRb
 FlhQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUJY/l4tToykfNHW2DrXVOInux2Lq511TSvBgSrwWbwjvJzPqJtC09Dg43uLije83N5dpx3S/SntBibTIcaFeP8@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yzu/oCMHetl0qeo9vyphZmx/0HybKpzLfraXbGb7ArzoHOrcEsa
 Ba3t3cTHDTgbDRMd+a57MbV7UfOWzIPhdKnpuRptQPpji1d9qoEoVrR4IP5sGjLOrzE=
X-Gm-Gg: ATEYQzxCdVoZ0L+ZnedhVv0ySUqs+6JyXuSOUfP9HxmlRVpzR5hBlkuilKIKN1j8ITs
 fHTq3qBzgN4cZk5WTp7cyTDGZxhAMjhgqoEpDPVdF1xIteX8thciOxet9hey6/8uL41woqI9YZw
 a1kpLfTd7W5s0/lASYPJKXtkhZ1C145hENYA/Xgb46hNtn60VCEv2PHqjpto//rknWRj8ZZSuek
 SZIBf+mNazBa/3DZGS7dloecC92X53c0fTUt+wP2vqAUL0uukX3g1pLb7wVXKlw1Z6+vTohDbT/
 KVUhSB8Y9Nl2L5x+eppLoQ+TLCeW0ajTKO9kDVoKrk5ggXCf5dHyZvWOaOXQU0QytomtQL+Xmg8
 TIggCKINHI/LydsWdTQQvzAMc6AMbDNg3co24/eCfOrtq4GttZATF4vbprJC/OZfuAFSHA4pnjE
 ZwbuOAdvrTn6I4DA1K5vzoUgzSGr22TgnBDL5hRgYQtE+LHr4tKfhIjtyCInnl9muNaknqUkLqB
 zvc+VMIi5AcOx3QcHGtuFNYzScSCThrug==
X-Received: by 2002:a05:600c:c167:b0:483:9139:4c1d with SMTP id
 5b1f17b1804b1-486fedd4143mr157583945e9.14.1774258709543; 
 Mon, 23 Mar 2026 02:38:29 -0700 (PDT)
Received: from fedora.communityfibre.co.uk
 ([2a02:6b6f:fb26:6400:da6:2a24:3e4a:d588])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-486ff1c2026sm75018955e9.27.2026.03.23.02.38.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Mar 2026 02:38:29 -0700 (PDT)
From: George Saad <geoo115@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Date: Mon, 23 Mar 2026 09:38:28 +0000
Message-ID: <20260323093828.763205-1-geoo115@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <2026032354-country-saddlebag-5331@gregkh>
References: <2026032354-country-saddlebag-5331@gregkh>
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
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
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit [geoo115(at)gmail.com]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [geoo115(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.48 listed in wl.mailspike.net]
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to DNSWL
 was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#DnsBlocklists-dnsbl-block
 for more information. [209.85.128.48 listed in list.dnswl.org]
X-Headers-End: 1w4bk4-0000px-Av
Subject: [f2fs-dev] [PATCH v2] f2fs: fix use-after-free of sbi in
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
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-0.01 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:gregkh@linuxfoundation.org,m:jaegeuk@kernel.org,m:geoo115@gmail.com,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	DKIM_MIXED(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geoo115@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[geoo115@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,lists.sourceforge.net];
	FROM_HAS_DN(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,gmail.com:s=20230601];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,gmail.com:-];
	RCPT_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:dkim]
X-Rspamd-Queue-Id: EBFB32EF32A
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
Signed-off-by: George Saad <geoo115@gmail.com>
---
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
