Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F783723BFA
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  6 Jun 2023 10:39:58 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q6SEL-0005pT-Dy;
	Tue, 06 Jun 2023 08:39:53 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <richard@nod.at>) id 1q6SEJ-0005pE-JV
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 06 Jun 2023 08:39:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Subject:References:In-Reply-To:Message-ID:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XZnUqfGVZwo9vlQNApdagMl1Tcok+/+t2NZNcSYyGN4=; b=FsrYtlFOKOlgrsm1nzBzb77zBE
 jauq/C+TZdxhkwkcsKtlcLgahvDaLE583SQ23naI4fO+76kYvvHB3BHKnZO4jvsqRVBf7NUU7aajI
 gunLWtdSg39GHGHFc/ywD88UP5eHiidBXssyqBBuVF5sWlyMDpm1D/rXTUONj7OLa6CQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:References:
 In-Reply-To:Message-ID:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=XZnUqfGVZwo9vlQNApdagMl1Tcok+/+t2NZNcSYyGN4=; b=QeKIfxwFhOj3pVD/MBM6HN+YUl
 oxGo4OqD+9UW+Kn657xINYy0sowY7QniTQclgdXCCAyXFndZQNwmiZcoK8U+aJ/N7z1JggcFS+XXo
 h8cNAlqO3jARKv3tw/uareV4HVtudnT3032t+Sf0b/a5DWekfiOeIHsPkXYflvIOhqK8=;
Received: from lithops.sigma-star.at ([195.201.40.130])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q6SEI-00CYcO-UJ for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 06 Jun 2023 08:39:51 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 89E7C63CC135;
 Tue,  6 Jun 2023 10:20:47 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id w2bdPD93IvhE; Tue,  6 Jun 2023 10:20:47 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 14A1D616B2CD;
 Tue,  6 Jun 2023 10:20:47 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id X5LSD106M-YC; Tue,  6 Jun 2023 10:20:46 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id D62D563CC135;
 Tue,  6 Jun 2023 10:20:46 +0200 (CEST)
Date: Tue, 6 Jun 2023 10:20:46 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: hch <hch@lst.de>
Message-ID: <766259639.3687124.1686039646763.JavaMail.zimbra@nod.at>
In-Reply-To: <20230606073950.225178-26-hch@lst.de>
References: <20230606073950.225178-1-hch@lst.de>
 <20230606073950.225178-26-hch@lst.de>
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF97 (Linux)/8.8.12_GA_3809)
Thread-Topic: remove commented out code in ubd_open
Thread-Index: XkjrL/wptcQ24bQlPJHDQOJLYTpcmQ==
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  ----- Ursprüngliche Mail ----- > Von: "hch" <hch@lst.de>
   > This code has been dead forever, make sure it doesn't show up in code >
   searches. > > Signed-off-by: Christoph Hellwig <hch@lst.de> > --- > [...] 
 
 Content analysis details:   (0.0 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.0 T_SPF_PERMERROR        SPF: test of record failed (permerror)
X-Headers-End: 1q6SEI-00CYcO-UJ
Subject: Re: [f2fs-dev] [PATCH 25/31] ubd: remove commented out code in
 ubd_open
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-nvme@lists.infradead.org,
 Phillip Potter <phil@philpotter.co.uk>, Chris Mason <clm@fb.com>,
 dm-devel <dm-devel@redhat.com>, "Md. Haris Iqbal" <haris.iqbal@ionos.com>,
 Pavel Machek <pavel@ucw.cz>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Jack Wang <jinpu.wang@ionos.com>, linux-nilfs@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-pm <linux-pm@vger.kernel.org>,
 linux-um <linux-um@lists.infradead.org>, Josef Bacik <josef@toxicpanda.com>,
 Coly Li <colyli@suse.de>, linux-block <linux-block@vger.kernel.org>,
 linux-bcache@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>,
 David Sterba <dsterba@suse.com>, Jens Axboe <axboe@kernel.dk>,
 Christian Brauner <brauner@kernel.org>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 linux-btrfs <linux-btrfs@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogImhjaCIgPGhjaEBsc3QuZGU+
Cj4gVGhpcyBjb2RlIGhhcyBiZWVuIGRlYWQgZm9yZXZlciwgbWFrZSBzdXJlIGl0IGRvZXNuJ3Qg
c2hvdyB1cCBpbiBjb2RlCj4gc2VhcmNoZXMuCj4gCj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3Bo
IEhlbGx3aWcgPGhjaEBsc3QuZGU+Cj4gLS0tCj4gYXJjaC91bS9kcml2ZXJzL3ViZF9rZXJuLmMg
fCA3IC0tLS0tLS0KPiAxIGZpbGUgY2hhbmdlZCwgNyBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0t
Z2l0IGEvYXJjaC91bS9kcml2ZXJzL3ViZF9rZXJuLmMgYi9hcmNoL3VtL2RyaXZlcnMvdWJkX2tl
cm4uYwo+IGluZGV4IDhiNzk1NTQ5NjhhZGRiLi4yMGMxYTE2MTk5YzUwMyAxMDA2NDQKPiAtLS0g
YS9hcmNoL3VtL2RyaXZlcnMvdWJkX2tlcm4uYwo+ICsrKyBiL2FyY2gvdW0vZHJpdmVycy91YmRf
a2Vybi5jCj4gQEAgLTExNzAsMTMgKzExNzAsNiBAQCBzdGF0aWMgaW50IHViZF9vcGVuKHN0cnVj
dCBnZW5kaXNrICpkaXNrLCBmbW9kZV90IG1vZGUpCj4gCX0KPiAJdWJkX2Rldi0+Y291bnQrKzsK
PiAJc2V0X2Rpc2tfcm8oZGlzaywgIXViZF9kZXYtPm9wZW5mbGFncy53KTsKPiAtCj4gLQkvKiBU
aGlzIHNob3VsZCBubyBtb3JlIGJlIG5lZWRlZC4gQW5kIGl0IGRpZG4ndCB3b3JrIGFueXdheSB0
byBleGNsdWRlCj4gLQkgKiByZWFkLXdyaXRlIHJlbW91bnRpbmcgb2YgZmlsZXN5c3RlbXMuKi8K
PiAtCS8qaWYoKG1vZGUgJiBGTU9ERV9XUklURSkgJiYgIXViZF9kZXYtPm9wZW5mbGFncy53KXsK
PiAtCSAgICAgICAgaWYoLS11YmRfZGV2LT5jb3VudCA9PSAwKSB1YmRfY2xvc2VfZGV2KHViZF9k
ZXYpOwo+IC0JICAgICAgICBlcnIgPSAtRVJPRlM7Cj4gLQl9Ki8KCkFja2VkLWJ5OiBSaWNoYXJk
IFdlaW5iZXJnZXIgPHJpY2hhcmRAbm9kLmF0PgoKVGhhbmtzLAovL3JpY2hhcmQKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVs
IG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRw
czovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVs
Cg==
