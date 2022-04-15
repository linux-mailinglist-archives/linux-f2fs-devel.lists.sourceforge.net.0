Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F30DF50218C
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 15 Apr 2022 06:53:48 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nfDxs-0000lX-2g; Fri, 15 Apr 2022 04:53:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2) (envelope-from
 <BATV+2d633663de0085320ac7+6809+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1nfDxp-0000kq-NJ; Fri, 15 Apr 2022 04:53:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pjOlLI0zIPscdljJBqydWvc1kCbsO4mNomowvsnW144=; b=FustAGGzGrzeUdsZJPzF+LOUks
 ll2QZgS0/140zX5Su6pULcS7Du/8nEjPMowZ7YtNCcgV4wRF8pgqAvzjS+c1ZyKeQQdiZaQRJkJnX
 NFd32aVwC9Ye4IEaKP+bIJgRDLJ4S9Mt4j8nYjsRaw3mZedAWlfo7wRHZDX2siEFNUdQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=pjOlLI0zIPscdljJBqydWvc1kCbsO4mNomowvsnW144=; b=aH8nkTRcJMiuM9HGgtbprhfnpU
 X6/TwuhVwFouJOarCkSgA2iI85f2d/uQxKfGZvEWO6w/IaWtb9Whvjbe7c7gqhIeqIy0ic5bvF5Px
 ItLth26oBHuYGAZo0fmb5qGqqC7mryu3R3sQjtQCqWumWnGIs6Wv6OvHB6MT72KyiqMw=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nfDxn-0001pa-KS; Fri, 15 Apr 2022 04:53:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=pjOlLI0zIPscdljJBqydWvc1kCbsO4mNomowvsnW144=; b=qvkOjPFjyqYMQWW/2QWIK68ENP
 k2NNTMvf9yJkIIsMinaHWq3ShtV9GAA9eD1j84n/4A1YSynSJPbH7xunvM4gFW2tBAaf34uDjFYTF
 Cf27zURP5kxthNnuilxHYkuF0+dYk/s+KgITZDeRBuWDyLf29iyj7NC5GSjUBL7HTLudqqDHJV7jI
 umQOzmF/ghCqietP9jcYeXWa5VJNEKLQMKEWsHvHjmzPuAlTBx/BxH8sjV6Sj89/sE85wKvCAMm7z
 4onw1pEIPzrLUGePDGOaGXDfMTfY5lSCh3pdlvTomsyZDMHzABEpf6210R46hSLONPkgfa2cukRRf
 iN4Lrpmg==;
Received: from [2a02:1205:504b:4280:f5dd:42a4:896c:d877] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nfDxZ-008OtX-AH; Fri, 15 Apr 2022 04:53:29 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Fri, 15 Apr 2022 06:52:37 +0200
Message-Id: <20220415045258.199825-7-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220415045258.199825-1-hch@lst.de>
References: <20220415045258.199825-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -2.2 (--)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  The bdev version does the right thing for partitions, so use
    that. Fixes: 9104d31a759f ("drbd: introduce WRITE_SAME support") Signed-off-by:
    Christoph Hellwig <hch@lst.de> Acked-by: Christoph Böhmwalder <christoph.boehmwalder@linbit.com>
    --- drivers/block/drbd/drbd_ [...] 
 
 Content analysis details:   (-2.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
                             medium trust
                             [198.137.202.133 listed in list.dnswl.org]
  0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
                             mail domains are different
  0.0 SPF_NONE               SPF: sender does not publish an SPF Record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1nfDxn-0001pa-KS
Subject: [f2fs-dev] [PATCH 06/27] drbd: use bdev_alignment_offset instead of
 queue_alignment_offset
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
Cc: jfs-discussion@lists.sourceforge.net, linux-nvme@lists.infradead.org,
 virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
 dm-devel@redhat.com, target-devel@vger.kernel.org,
 linux-mtd@lists.infradead.org, drbd-dev@lists.linbit.com,
 linux-s390@vger.kernel.org, linux-nilfs@vger.kernel.org,
 linux-scsi@vger.kernel.org, cluster-devel@redhat.com,
 xen-devel@lists.xenproject.org, linux-ext4@vger.kernel.org,
 linux-um@lists.infradead.org, nbd@other.debian.org,
 linux-block@vger.kernel.org, linux-bcache@vger.kernel.org,
 ceph-devel@vger.kernel.org, linux-raid@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org,
 =?UTF-8?q?Christoph=20B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>,
 ocfs2-devel@oss.oracle.com, linux-fsdevel@vger.kernel.org,
 ntfs3@lists.linux.dev, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

VGhlIGJkZXYgdmVyc2lvbiBkb2VzIHRoZSByaWdodCB0aGluZyBmb3IgcGFydGl0aW9ucywgc28g
dXNlIHRoYXQuCgpGaXhlczogOTEwNGQzMWE3NTlmICgiZHJiZDogaW50cm9kdWNlIFdSSVRFX1NB
TUUgc3VwcG9ydCIpClNpZ25lZC1vZmYtYnk6IENocmlzdG9waCBIZWxsd2lnIDxoY2hAbHN0LmRl
PgpBY2tlZC1ieTogQ2hyaXN0b3BoIELDtmhtd2FsZGVyIDxjaHJpc3RvcGguYm9laG13YWxkZXJA
bGluYml0LmNvbT4KLS0tCiBkcml2ZXJzL2Jsb2NrL2RyYmQvZHJiZF9tYWluLmMgfCAyICstCiAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2Jsb2NrL2RyYmQvZHJiZF9tYWluLmMgYi9kcml2ZXJzL2Jsb2NrL2RyYmQvZHJi
ZF9tYWluLmMKaW5kZXggYzM5YjA0YmRhMjYxZi4uN2I1MDFjOGQ1OTkyOCAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ibG9jay9kcmJkL2RyYmRfbWFpbi5jCisrKyBiL2RyaXZlcnMvYmxvY2svZHJiZC9k
cmJkX21haW4uYwpAQCAtOTM5LDcgKzkzOSw3IEBAIGludCBkcmJkX3NlbmRfc2l6ZXMoc3RydWN0
IGRyYmRfcGVlcl9kZXZpY2UgKnBlZXJfZGV2aWNlLCBpbnQgdHJpZ2dlcl9yZXBseSwgZW51CiAJ
CXAtPnFsaW0tPmxvZ2ljYWxfYmxvY2tfc2l6ZSA9CiAJCQljcHVfdG9fYmUzMihiZGV2X2xvZ2lj
YWxfYmxvY2tfc2l6ZShiZGV2KSk7CiAJCXAtPnFsaW0tPmFsaWdubWVudF9vZmZzZXQgPQotCQkJ
Y3B1X3RvX2JlMzIocXVldWVfYWxpZ25tZW50X29mZnNldChxKSk7CisJCQljcHVfdG9fYmUzMihi
ZGV2X2FsaWdubWVudF9vZmZzZXQoYmRldikpOwogCQlwLT5xbGltLT5pb19taW4gPSBjcHVfdG9f
YmUzMihiZGV2X2lvX21pbihiZGV2KSk7CiAJCXAtPnFsaW0tPmlvX29wdCA9IGNwdV90b19iZTMy
KGJkZXZfaW9fb3B0KGJkZXYpKTsKIAkJcC0+cWxpbS0+ZGlzY2FyZF9lbmFibGVkID0gYmxrX3F1
ZXVlX2Rpc2NhcmQocSk7Ci0tIAoyLjMwLjIKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgt
ZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3Jn
ZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
