Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 39E0A4F554D
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  6 Apr 2022 08:05:56 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nbynf-0005ZF-Pz; Wed, 06 Apr 2022 06:05:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2) (envelope-from
 <BATV+4210fbe0094d03a681f9+6800+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1nbynd-0005Z0-P8; Wed, 06 Apr 2022 06:05:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=L9ybHoqkMQFtFgAKSKAUEOlBEraEcHfvZKxNTrnAqQ8=; b=XtM9aVN5qFOFmlJh0UGpMYiB13
 GZf38PSKGXZ1bdeEA5ThQ5naRWWyyP5bB1wz7GcjDuhL9MCfgM3A0nx+rDWTsXIrc6NHINB1fkeSu
 4StGKdNrP+RR7Bk5Xnh1xa+a4YjbNgFYjBICbpxcT7/Y5crFAJtf+duZIG+QnkrdRb8E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=L9ybHoqkMQFtFgAKSKAUEOlBEraEcHfvZKxNTrnAqQ8=; b=GONQTaMNgphf6Z6QrXPzspunZg
 MzYEp0LWNvhOsuoj+Ytr3AIZkSjdpx6fsS8AHd3DeAaEI4exe6ND7ZBhGwHfhayi0FzfXcl6IdwpF
 xgIw6YicYc49m8ZFyilDvmJU1d/LkZv3PcomVaDeOD36lYMkewg9YiYTHVL1uzjIEjq8=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nbynb-0000td-LM; Wed, 06 Apr 2022 06:05:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=L9ybHoqkMQFtFgAKSKAUEOlBEraEcHfvZKxNTrnAqQ8=; b=txJ9J4YPrbulci+oxX/K1jvzXj
 8gms4zn8OqR/RStS8wT9jgDaq6tCr0xQ50GF2QciDZSPopEVcnXqcG9w2/K5XJ1BTwpW2RGCMVDA3
 jmixF0VaBheGVq3jZaojwfuYLAQ4/4Mglf66TIU/khX83gOPm4zJJDJ3ou8TXUFMlSJvyOL8I9hxL
 hx9nNbqp2gLScWmRlyHDlcj4q4nSOat130S2f7AGVfoaMNZ1nXqC2ZbfhhUNn3oLONf4dJ00se0wZ
 /QPbSgFP9I0m9WnIywznAmgQ/IfAzP4kiOxdsv2B4GrBWPwAkOiqBswZsWccIWUz5jFEPpf/f4t6x
 GlFV09uw==;
Received: from 213-225-3-188.nat.highway.a1.net ([213.225.3.188]
 helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbynL-003uoA-Rk; Wed, 06 Apr 2022 06:05:32 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Wed,  6 Apr 2022 08:04:52 +0200
Message-Id: <20220406060516.409838-4-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220406060516.409838-1-hch@lst.de>
References: <20220406060516.409838-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -2.1 (--)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Use the proper bdev_discard_alignment helper that accounts
    for partition offsets. Fіxes: c66ac9db8d4a ("[SCSI] target: Add LIO target
    core v4.0.0-rc6") Signed-off-by: Christoph Hellwig <hch@lst.de> --- drivers/target/target_core_device.c
    | 4 ++-- 1 file changed, 2 insertions(+), 2 [...] 
 
 Content analysis details:   (-2.1 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
                             medium trust
                             [198.137.202.133 listed in list.dnswl.org]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
                             mail domains are different
  0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
X-Headers-End: 1nbynb-0000td-LM
Subject: [f2fs-dev] [PATCH 03/27] target: fix discard alignment on partitions
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
 linux-xfs@vger.kernel.org, ocfs2-devel@oss.oracle.com,
 linux-fsdevel@vger.kernel.org, ntfs3@lists.linux.dev,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

VXNlIHRoZSBwcm9wZXIgYmRldl9kaXNjYXJkX2FsaWdubWVudCBoZWxwZXIgdGhhdCBhY2NvdW50
cyBmb3IgcGFydGl0aW9uCm9mZnNldHMuCgpG0ZZ4ZXM6IGM2NmFjOWRiOGQ0YSAoIltTQ1NJXSB0
YXJnZXQ6IEFkZCBMSU8gdGFyZ2V0IGNvcmUgdjQuMC4wLXJjNiIpClNpZ25lZC1vZmYtYnk6IENo
cmlzdG9waCBIZWxsd2lnIDxoY2hAbHN0LmRlPgotLS0KIGRyaXZlcnMvdGFyZ2V0L3RhcmdldF9j
b3JlX2RldmljZS5jIHwgNCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAy
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvdGFyZ2V0L3RhcmdldF9jb3JlX2Rl
dmljZS5jIGIvZHJpdmVycy90YXJnZXQvdGFyZ2V0X2NvcmVfZGV2aWNlLmMKaW5kZXggM2ExZWM3
MDVjZDgwYi4uMTZlNzc1YmNmNGE3YyAxMDA2NDQKLS0tIGEvZHJpdmVycy90YXJnZXQvdGFyZ2V0
X2NvcmVfZGV2aWNlLmMKKysrIGIvZHJpdmVycy90YXJnZXQvdGFyZ2V0X2NvcmVfZGV2aWNlLmMK
QEAgLTg0OSw4ICs4NDksOCBAQCBib29sIHRhcmdldF9jb25maWd1cmVfdW5tYXBfZnJvbV9xdWV1
ZShzdHJ1Y3Qgc2VfZGV2X2F0dHJpYiAqYXR0cmliLAogCSAqLwogCWF0dHJpYi0+bWF4X3VubWFw
X2Jsb2NrX2Rlc2NfY291bnQgPSAxOwogCWF0dHJpYi0+dW5tYXBfZ3JhbnVsYXJpdHkgPSBxLT5s
aW1pdHMuZGlzY2FyZF9ncmFudWxhcml0eSAvIGJsb2NrX3NpemU7Ci0JYXR0cmliLT51bm1hcF9n
cmFudWxhcml0eV9hbGlnbm1lbnQgPSBxLT5saW1pdHMuZGlzY2FyZF9hbGlnbm1lbnQgLwotCQkJ
CQkJCQlibG9ja19zaXplOworCWF0dHJpYi0+dW5tYXBfZ3JhbnVsYXJpdHlfYWxpZ25tZW50ID0K
KwkJYmRldl9kaXNjYXJkX2FsaWdubWVudChiZGV2KSAvIGJsb2NrX3NpemU7CiAJcmV0dXJuIHRy
dWU7CiB9CiBFWFBPUlRfU1lNQk9MKHRhcmdldF9jb25maWd1cmVfdW5tYXBfZnJvbV9xdWV1ZSk7
Ci0tIAoyLjMwLjIKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0
cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlz
dGluZm8vbGludXgtZjJmcy1kZXZlbAo=
