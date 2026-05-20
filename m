Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sNSpFw+kDWq10QUAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 20 May 2026 14:07:43 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DFE058D4A8
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 20 May 2026 14:07:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8ZcQ/Z/lR1QXRsYHjKix2nOPhuUSLApVhcnTFvEcAvY=; b=eSL2lUxzHOt7VKQ2cxwNNsGwn3
	RZAamA96aCnKRnHxM3iDTVdjsZVrUf0TapaFqHsk4TxF/CBlF+3iK+4aLLzpWOxx292sgp9yhtrc7
	eycpPWYvME7PzQvJetWDLZa9F+VHvhmZnjQLUDegkVwOmOsa4x0DF5wbpyqNtuqS2KIo=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wPfhz-000650-OK;
	Wed, 20 May 2026 12:07:29 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <qwjhust@gmail.com>) id 1wPfhy-00064u-3J
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 20 May 2026 12:07:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gPZaZ4osb8hVVu2xsq4TPAaFFKt1rpp+aWrxoF098CA=; b=gQ0m5AAB8HlIXKgKHGMmfqfzXf
 FiFY97dWYa6aQp7O21T7fJ86wAC2CQzCyrKmn/Zxm4GPlIDldusQK0xFKoI+UMw7qnnbkH0Qn3MfD
 c8+jznMAjc48rGgvfO/dzgdAg/R8boiwcbekz4FN294GnyhxjbqvOtk029lImvwKeADE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=gPZaZ4osb8hVVu2xsq4TPAaFFKt1rpp+aWrxoF098CA=; b=Q
 nW/2cPhbPh6q+zLJtX/Sp3lPCMWS7PZRtc9vU4egABR+W+aX9cG1D7JsNT8o/NdVtqGojptswAhWc
 8kcc4olBG57JTuoe/yGeoN3aikwF0QnxUV6syhRisKpOTEpaYlVgai6mV+gr/516I7UGYi1eK30JP
 xX/djnhENb+S9MDA=;
Received: from mail-pj1-f46.google.com ([209.85.216.46])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1wPfhq-00059S-TC for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 20 May 2026 12:07:27 +0000
Received: by mail-pj1-f46.google.com with SMTP id
 98e67ed59e1d1-365d8e43759so2552564a91.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 20 May 2026 05:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1779278833; x=1779883633; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=gPZaZ4osb8hVVu2xsq4TPAaFFKt1rpp+aWrxoF098CA=;
 b=lSura/o6OyO/QBPszk/YpCk7Q8owdXxAPZwRXxAmIIjyx8aeWInejZ8q9dnGBwtbqY
 u0LNl8W/Nk/eh8hO86e+B1YT4U4djE9hMbMGfIYFJCOrkDHyVMlbWPFK/ojqL8fL45mS
 qoJNwgZX4GRZ7hnuL/JnBpMDPKBp2K8JVmhhfxa8p4s6lrdTP0/h+OoCBI+n2K3hjo3V
 aUhcARYSl1Hb2JOb6gWBj9QI6n9KRZ4Y4pcMI4w/3nGuDVuKsQrH5OZ5eigwfOY8zP95
 4BfRyJF+KxGxNp0l21RLRdzLzuKA1+mSEqqUmsM4Ti5p/bNVZ0K+hSzWSmTAMDlaINrd
 4ppw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779278833; x=1779883633;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gPZaZ4osb8hVVu2xsq4TPAaFFKt1rpp+aWrxoF098CA=;
 b=ptd1IlsxVFJCf8uoS0VqVJOKCdrHIdPGEYPYIaJCJGgPpTYFIgPox+WfHLs9jQQKAj
 0RvRnSR3twkONdSNycswfTPxCrwr1WXIoZbVT/RoQYtbXNFTC/tHgpOZF0h5l3U6pxmz
 nSxXjmgF7mwe1AWPLcGes5fOUJO8cKX1gGotQ/Fq6gIweJFZYc4Yo78JPpGG6/uZTskO
 5BDrJGUvrEiCKnxyICnzBQ3Xmjq2vIlpvkzdMl5//xUF0JksLOPPXQzSQ1ObUcIyOLfK
 WfkJZaihulNv8bLgXHb6cNtVmxnZ0GBbQ9bLrMmDK9z18SIYDWRmmn0xDE9XAaFhO/6v
 d7eA==
X-Forwarded-Encrypted: i=1;
 AFNElJ9tKcdTlcqfoILWKSywzHheR/tDUNphxhGzhPXFTe+Wx2bV2bgFI++aZ7NaAlrK072cKdFNGQiuVl9mFRs9S3CA@lists.sourceforge.net
X-Gm-Message-State: AOJu0YwzhGCeP1kt5WHBNYgFg3K8ULRWDx4cNR1I5EdKKJ7cvDOpirt+
 FKayFgMdVyoVhC00F5rP2/4vzES0GGOg+nAOY/Ne/rNRYSc0aZoo90lV
X-Gm-Gg: Acq92OGP9XMlB8+vXBpYKkvyDeoJUNFKNopKfNJMKBm+Eh/aDp2sGx+oLGEY6krfby6
 G0Kkws9N4cG+jmjDeTgvF/WCbAfZQ5nHRHkQeZWO7uEaCE4kNT4LPSss3qBDxa65rSWKCAaOij6
 tYcZxFGII3oXJcaDrosAz6X/v0oMhfnkoVJXXg6DhNoob9oKwWnYqZqr1oey2yTIgKEk3gzFbKu
 YQpoA3pPURrDDO6LmHjaQOMR/5yOIvuShp8kzGa1GgM9Ypcs5wVcxrdzk8LoJSynEE57DTYyOOH
 Unm/fFTbSEo4qE/bDhZg70jKzpuSYrpc+dWf4/r1D6itR8vYqUKxR54SzNTZQUkdvkdkOMY0G5p
 rsLt73vZi2J93F44u4n3rjsUtio9ZAYUr1n1IzxJj2mb3tKhEfQ33QkHLVxVHLOePyIt/lzoQYi
 1mVLk3MUitKpOa0YW7Eg9qzSHW+sjcctCVwKl1X4SCcXxg0U+tybcwbBfNrSgYcKN5MSxrsA==
X-Received: by 2002:a17:90a:c2ce:b0:35f:b9f1:fded with SMTP id
 98e67ed59e1d1-369514e68b3mr18404250a91.12.1779278832689; 
 Wed, 20 May 2026 05:07:12 -0700 (PDT)
Received: from qiwenjie-ThinkCentre-M760t.mioffice.cn ([43.224.245.179])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3695157c3cfsm17512595a91.5.2026.05.20.05.07.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 May 2026 05:07:12 -0700 (PDT)
From: Wenjie Qi <qwjhust@gmail.com>
X-Google-Original-From: Wenjie Qi <qiwenjie@xiaomi.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Wed, 20 May 2026 20:07:05 +0800
Message-ID: <20260520120705.1263756-1-qiwenjie@xiaomi.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  f2fs_write_single_node_folio() takes an io_type argument,
 but still passes FS_GC_NODE_IO to __write_node_folio() unconditionally. This
 was harmless while the helper was only used by f2fs_move_node_folio(), whose
 caller passes FS_GC_NODE_IO. However, commit fe9b8b30b971 ("f2fs: fix inline
 data not being written to disk in writeba [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [qwjhust(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.46 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1wPfhq-00059S-TC
Subject: [f2fs-dev] [PATCH] f2fs: pass correct iostat type for single node
 writes
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
Cc: qwjhust@gmail.com, qiwenjie@xiaomi.com, yangyongpeng@xiaomi.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-1.01 / 15.00];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	DKIM_MIXED(0.00)[];
	ARC_NA(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,gmail.com:s=20251104];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jaegeuk@kernel.org,m:chao@kernel.org,m:qwjhust@gmail.com,m:qiwenjie@xiaomi.com,m:yangyongpeng@xiaomi.com,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER(0.00)[qwjhust@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FREEMAIL_CC(0.00)[gmail.com,xiaomi.com,vger.kernel.org,lists.sourceforge.net];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,gmail.com:-];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qwjhust@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:dkim,lists.sourceforge.net:rdns,lists.sourceforge.net:helo]
X-Rspamd-Queue-Id: 9DFE058D4A8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

f2fs_write_single_node_folio() takes an io_type argument, but still
passes FS_GC_NODE_IO to __write_node_folio() unconditionally.

This was harmless while the helper was only used by
f2fs_move_node_folio(), whose caller passes FS_GC_NODE_IO. However,
commit fe9b8b30b971 ("f2fs: fix inline data not being written to disk
in writeback path") made f2fs_inline_data_fiemap() call the helper with
FS_NODE_IO for FIEMAP_FLAG_SYNC.

Honor the caller supplied io_type so inline-data FIEMAP sync writeback is
accounted as normal node IO instead of GC node IO, while the GC path
continues to pass FS_GC_NODE_IO explicitly.

Fixes: fe9b8b30b971 ("f2fs: fix inline data not being written to disk in writeback path")
Signed-off-by: Wenjie Qi <qiwenjie@xiaomi.com>
---
 fs/f2fs/node.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index 4e5bd9e4cfc..6a9e77c87d1 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -1875,7 +1875,7 @@ int f2fs_write_single_node_folio(struct folio *node_folio, int sync_mode,
 	}
 
 	if (!__write_node_folio(node_folio, false, false, NULL,
-				&wbc, false, FS_GC_NODE_IO, NULL))
+				&wbc, false, io_type, NULL))
 		err = -EAGAIN;
 	goto release_folio;
 out_folio:
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
