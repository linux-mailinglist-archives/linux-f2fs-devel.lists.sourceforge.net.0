Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 42D16723BEA
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  6 Jun 2023 10:35:01 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q6S9Z-0008HH-RK;
	Tue, 06 Jun 2023 08:34:58 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <richard@nod.at>) id 1q6S9W-0008Fj-H4
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 06 Jun 2023 08:34:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Subject:References:In-Reply-To:Message-ID:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JKzIWMKgH2eFCpqCwaLEX/JBPTfFT3c4kI9KZSUzxOk=; b=FQuqhzTQcjBltB6c1dcEmp4qdY
 dzv4kBtpQ4di33NzapOPsmN3vYw2JaVKo9pwg3xAV7j8e1jwF60DqcnmQifHkXaiiCkv6IK7/TAnQ
 Wqyt1HTdjK1u9ow90sKQVNx7vr/CC4VDdJ6w1Y2Hhg+ovgIdwZ1GaOJzxyfLVTXovx6M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:References:
 In-Reply-To:Message-ID:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=JKzIWMKgH2eFCpqCwaLEX/JBPTfFT3c4kI9KZSUzxOk=; b=Htomg5qz9SrOP0WuEDWGuMSWCC
 XH/mjMtn4L+fl3DdsqkqbIWALiOSev+huMV44Y/Byvq2qzklei061gVYywJhDaWeV0qEf7nd+GgJx
 /fvz977xNk5Cd5Gw3NcmTCJcAnsvxyilpni6Xl34TK5oHv84Sc9m9ZMfZBIZF7OX9Nhg=;
Received: from lithops.sigma-star.at ([195.201.40.130])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q6S9S-00CYGn-Jd for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 06 Jun 2023 08:34:55 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id A2DC56081100;
 Tue,  6 Jun 2023 10:24:39 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id siZzZpJorNJf; Tue,  6 Jun 2023 10:24:39 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 34240616B2CF;
 Tue,  6 Jun 2023 10:24:39 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id YeogKuuY1hxw; Tue,  6 Jun 2023 10:24:39 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id E97466081100;
 Tue,  6 Jun 2023 10:24:38 +0200 (CEST)
Date: Tue, 6 Jun 2023 10:24:38 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: hch <hch@lst.de>
Message-ID: <318049918.3687133.1686039878761.JavaMail.zimbra@nod.at>
In-Reply-To: <20230606073950.225178-24-hch@lst.de>
References: <20230606073950.225178-1-hch@lst.de>
 <20230606073950.225178-24-hch@lst.de>
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF97 (Linux)/8.8.12_GA_3809)
Thread-Topic: block: use a simple bool to track open for write
Thread-Index: X/xlpyhSf8bloXE5HNEoh3ox5Q1J9Q==
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  ----- Ursprüngliche Mail ----- > Von: "hch" <hch@lst.de>
   > Instead of propagating the fmode_t, just use a bool to track if a mtd >
   block device was opened for writing. > > Signed-off-by: Christoph He [...]
    
 
 Content analysis details:   (0.0 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.0 T_SPF_PERMERROR        SPF: test of record failed (permerror)
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1q6S9S-00CYGn-Jd
Subject: Re: [f2fs-dev] [PATCH 23/31] mtd: block: use a simple bool to track
 open for write
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
 "Rafael J. Wysocki" <rafael@kernel.org>,
 linux-nvme <linux-nvme@lists.infradead.org>,
 Phillip Potter <phil@philpotter.co.uk>, Chris Mason <clm@fb.com>,
 dm-devel <dm-devel@redhat.com>, "Md. Haris Iqbal" <haris.iqbal@ionos.com>,
 Pavel Machek <pavel@ucw.cz>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Jack Wang <jinpu.wang@ionos.com>, linux-nilfs <linux-nilfs@vger.kernel.org>,
 linux-scsi <linux-scsi@vger.kernel.org>, linux-pm <linux-pm@vger.kernel.org>,
 linux-um <linux-um@lists.infradead.org>, Josef Bacik <josef@toxicpanda.com>,
 Coly Li <colyli@suse.de>, linux-block <linux-block@vger.kernel.org>,
 linux-bcache <linux-bcache@vger.kernel.org>, Al Viro <viro@zeniv.linux.org.uk>,
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
Cj4gSW5zdGVhZCBvZiBwcm9wYWdhdGluZyB0aGUgZm1vZGVfdCwganVzdCB1c2UgYSBib29sIHRv
IHRyYWNrIGlmIGEgbXRkCj4gYmxvY2sgZGV2aWNlIHdhcyBvcGVuZWQgZm9yIHdyaXRpbmcuCj4g
Cj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+Cj4gLS0tCj4g
ZHJpdmVycy9tdGQvbXRkX2Jsa2RldnMuYyAgICB8IDIgKy0KPiBkcml2ZXJzL210ZC9tdGRibG9j
ay5jICAgICAgIHwgMiArLQo+IGluY2x1ZGUvbGludXgvbXRkL2Jsa3RyYW5zLmggfCAyICstCj4g
MyBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4gCj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvbXRkL210ZF9ibGtkZXZzLmMgYi9kcml2ZXJzL210ZC9tdGRfYmxr
ZGV2cy5jCj4gaW5kZXggZjBiYjA5ZmRlOTVlM2EuLmJkMGI3NTQ1MzY0MzQ5IDEwMDY0NAo+IC0t
LSBhL2RyaXZlcnMvbXRkL210ZF9ibGtkZXZzLmMKPiArKysgYi9kcml2ZXJzL210ZC9tdGRfYmxr
ZGV2cy5jCj4gQEAgLTIwOCw3ICsyMDgsNyBAQCBzdGF0aWMgaW50IGJsa3RyYW5zX29wZW4oc3Ry
dWN0IGdlbmRpc2sgKmRpc2ssIGZtb2RlX3QgbW9kZSkKPiAJcmV0ID0gX19nZXRfbXRkX2Rldmlj
ZShkZXYtPm10ZCk7Cj4gCWlmIChyZXQpCj4gCQlnb3RvIGVycm9yX3JlbGVhc2U7Cj4gLQlkZXYt
PmZpbGVfbW9kZSA9IG1vZGU7Cj4gKwlkZXYtPndyaXRhYmxlID0gbW9kZSAmIEZNT0RFX1dSSVRF
Owo+IAo+IHVubG9jazoKPiAJZGV2LT5vcGVuKys7Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRk
L210ZGJsb2NrLmMgYi9kcml2ZXJzL210ZC9tdGRibG9jay5jCj4gaW5kZXggYTBhMTE5NGRjMWQ5
MDIuLmZhNDc2ZmI0ZGZmYjZjIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbXRkL210ZGJsb2NrLmMK
PiArKysgYi9kcml2ZXJzL210ZC9tdGRibG9jay5jCj4gQEAgLTI5NCw3ICsyOTQsNyBAQCBzdGF0
aWMgdm9pZCBtdGRibG9ja19yZWxlYXNlKHN0cnVjdCBtdGRfYmxrdHJhbnNfZGV2ICptYmQpCj4g
CQkgKiBJdCB3YXMgdGhlIGxhc3QgdXNhZ2UuIEZyZWUgdGhlIGNhY2hlLCBidXQgb25seSBzeW5j
IGlmCj4gCQkgKiBvcGVuZWQgZm9yIHdyaXRpbmcuCj4gCQkgKi8KPiAtCQlpZiAobWJkLT5maWxl
X21vZGUgJiBGTU9ERV9XUklURSkKPiArCQlpZiAobWJkLT53cml0YWJsZSkKPiAJCQltdGRfc3lu
YyhtYmQtPm10ZCk7Cj4gCQl2ZnJlZShtdGRibGstPmNhY2hlX2RhdGEpOwo+IAl9Cj4gZGlmZiAt
LWdpdCBhL2luY2x1ZGUvbGludXgvbXRkL2Jsa3RyYW5zLmggYi9pbmNsdWRlL2xpbnV4L210ZC9i
bGt0cmFucy5oCj4gaW5kZXggMTVjYzliOTVlMzJiNTIuLjZlNDcxNDM2YmJhNTU2IDEwMDY0NAo+
IC0tLSBhL2luY2x1ZGUvbGludXgvbXRkL2Jsa3RyYW5zLmgKPiArKysgYi9pbmNsdWRlL2xpbnV4
L210ZC9ibGt0cmFucy5oCj4gQEAgLTM0LDcgKzM0LDcgQEAgc3RydWN0IG10ZF9ibGt0cmFuc19k
ZXYgewo+IAlzdHJ1Y3QgYmxrX21xX3RhZ19zZXQgKnRhZ19zZXQ7Cj4gCXNwaW5sb2NrX3QgcXVl
dWVfbG9jazsKPiAJdm9pZCAqcHJpdjsKPiAtCWZtb2RlX3QgZmlsZV9tb2RlOwo+ICsJYm9vbCB3
cml0YWJsZTsKPiB9OwoKQWNrZWQtYnk6IFJpY2hhcmQgV2VpbmJlcmdlciA8cmljaGFyZEBub2Qu
YXQ+CgpUaGFua3MsCi8vcmljaGFyZAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMt
ZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0
L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
