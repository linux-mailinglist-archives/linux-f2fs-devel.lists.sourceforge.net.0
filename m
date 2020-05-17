Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CDE4A1D6DAB
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 17 May 2020 23:53:04 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jaRDT-0006bH-Ei; Sun, 17 May 2020 21:53:03 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <guoqing.jiang@cloud.ionos.com>) id 1jaRDS-0006bA-0c
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 17 May 2020 21:53:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=umFCQ4NMWCIE/enEbdR7IzBDkwF+7PPxVjQ7OU7ryME=; b=jcvgpN0VpiU6vekLAFzvWQ0C0q
 7rH5G1S20FMdEymoz0U19KC8kgze+IXsI/4jwWMHbdhJo8vTWhlG063rl0vg5qbJ+Ag0FrssVosDS
 SBqfbi7VwX+fM2iar9vdLZ8wWmLpNoD2lV95iXj7SIw0EoXW+sbV3zI7REQ2/V/Yy9zA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=umFCQ4NMWCIE/enEbdR7IzBDkwF+7PPxVjQ7OU7ryME=; b=L6amtAGEV77WzxtlAxboxtP1rj
 QJDDzo4yoqZWlYpuhnMjQRjVN8bIE5ltky++UyXP1W9z4b/ZitCaloT7Ikm3ZyJlox21fVk5ivHQ5
 MiA1rF4P5mYldd643EcmsY/GGqLaFPM5zl80vZmMA5FB+VMYnHmZhsUmiBZuhlJLqOmQ=;
Received: from mail-wm1-f66.google.com ([209.85.128.66])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jaRDQ-00Cly9-8g
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 17 May 2020 21:53:01 +0000
Received: by mail-wm1-f66.google.com with SMTP id w64so8181425wmg.4
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 17 May 2020 14:53:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cloud.ionos.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=umFCQ4NMWCIE/enEbdR7IzBDkwF+7PPxVjQ7OU7ryME=;
 b=bc9JiCyNi2SaYl+btE6yrujudYyNLl78V5XpCyZ9/4KEKAxZRAkGj+1u6RtqkAg8km
 AqFdngrJgZ/406TlWA1lT6giJ9khHuUW7QONSzFjqtf58qeWHJGMxhP3aPHFDtf+2zaQ
 mydxAV6NRzV2r1+bfnNomk9OOUhPLAlSKRxC16WEBfx4jes9GyHem4xpgvJTiW5lWMUw
 vhTlktN5Wp5bdjPQy+ibqrcIY+uBMIk5JRsyjeodQ5f5J23sr5oITBr9zBlowO7pPGPZ
 VRPpox3R7Qe8bogft+q4bqukDp6Glyy0BZW8Wg4rtv5njYWjLb6gNugwrmJhNroIrloy
 qcIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=umFCQ4NMWCIE/enEbdR7IzBDkwF+7PPxVjQ7OU7ryME=;
 b=QH+P3JbgPQ1xkRgs87hmPN3CfU68uKl2c+vMIJXdFNYaZ+cU0ba8mrQa14yrVW/Ith
 t8KW6w/xQTbkdds336DFbS0ud5Ta85b6jdfTcRZQs1cr5a8GP89rsgmxZKvyI6fLE7Ge
 SlPn0+nEyG24Budh+l+StlFw86scm4L0XZB4Pz29cMXdWqA7DRhgEnh+wz8N+9eEZs6C
 dBzXLeMf0Hb5ToJs8MJ5r/wEQDt6RbW8KIJiYaMi08fFtGijmaWQQBY3N+uGkmNBRIEM
 5ViZuv32vCciuG9oSkeCL2UJzhaxS7XBelDF4W12Epn1KXxAbQRhAcTjmME3rbT43bpr
 rNhw==
X-Gm-Message-State: AOAM533aJbpWyTOlX5W+olSns6EA2YhWFh25l9r/8eC6mhjjM1FEjcnr
 /E2hPT+ZngGZpoVt0x9ymUTL0CUlSKqS2Q==
X-Google-Smtp-Source: ABdhPJw4f9DasVjg3UWnPvpGkYC6F50+B/J+YVBxdXzbXqEpee6TDkiCS9KiwItSk/Fp8hTBso6ChQ==
X-Received: by 2002:a1c:545e:: with SMTP id p30mr15205009wmi.20.1589752043827; 
 Sun, 17 May 2020 14:47:23 -0700 (PDT)
Received: from ls00508.pb.local ([2001:1438:4010:2540:bc3e:92a1:7010:2763])
 by smtp.gmail.com with ESMTPSA id v126sm14441244wmb.4.2020.05.17.14.47.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 May 2020 14:47:23 -0700 (PDT)
From: Guoqing Jiang <guoqing.jiang@cloud.ionos.com>
To: akpm@linux-foundation.org,
	viro@zeniv.linux.org.uk
Date: Sun, 17 May 2020 23:47:09 +0200
Message-Id: <20200517214718.468-2-guoqing.jiang@cloud.ionos.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200517214718.468-1-guoqing.jiang@cloud.ionos.com>
References: <20200517214718.468-1-guoqing.jiang@cloud.ionos.com>
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.128.66 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.66 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jaRDQ-00Cly9-8g
Subject: [f2fs-dev] [PATCH 01/10] include/linux/pagemap.h: introduce
 attach/detach_page_private
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
Cc: Martin Brandenburg <martin@omnibond.com>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, david@fromorbit.com,
 Song Liu <song@kernel.org>, Yafang Shao <laoar.shao@gmail.com>,
 Mike Marshall <hubcap@omnibond.com>, Andreas Gruenbacher <agruenba@redhat.com>,
 "Darrick J. Wong" <darrick.wong@oracle.com>, Chris Mason <clm@fb.com>,
 willy@infradead.org, hch@infradead.org, devel@lists.orangefs.org,
 Josef Bacik <josef@toxicpanda.com>, linux-raid@vger.kernel.org,
 David Sterba <dsterba@suse.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Anton Altaparmakov <anton@tuxera.com>,
 Andreas Dilger <adilger@dilger.ca>,
 Guoqing Jiang <guoqing.jiang@cloud.ionos.com>,
 Yang Shi <yang.shi@linux.alibaba.com>,
 William Kucharski <william.kucharski@oracle.com>,
 linux-ntfs-dev@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 linux-fsdevel@vger.kernel.org, Roman Gushchin <guro@fb.com>,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

VGhlIGxvZ2ljIGluIGF0dGFjaF9wYWdlX2J1ZmZlcnMgYW5kICBfX2NsZWFyX3BhZ2VfYnVmZmVy
cyBhcmUgcXVpdGUKcGFpcmVkLCBidXQKCjEuIHRoZXkgYXJlIGxvY2F0ZWQgaW4gZGlmZmVyZW50
IGZpbGVzLgoKMi4gYXR0YWNoX3BhZ2VfYnVmZmVycyBpcyBpbXBsZW1lbnRlZCBpbiBidWZmZXJf
aGVhZC5oLCBzbyBpdCBjb3VsZCBiZQogICB1c2VkIGJ5IG90aGVyIGZpbGVzLiBCdXQgX19jbGVh
cl9wYWdlX2J1ZmZlcnMgaXMgc3RhdGljIGZ1bmN0aW9uIGluCiAgIGJ1ZmZlci5jIGFuZCBvdGhl
ciBwb3RlbnRpYWwgdXNlcnMgY2FuJ3QgY2FsbCB0aGUgZnVuY3Rpb24sIG1kLWJpdG1hcAogICBl
dmVuIGNvcGllZCB0aGUgZnVuY3Rpb24uCgpTbywgaW50cm9kdWNlIHRoZSBuZXcgYXR0YWNoL2Rl
dGFjaF9wYWdlX3ByaXZhdGUgdG8gcmVwbGFjZSB0aGVtLiBXaXRoCnRoZSBuZXcgcGFpciBvZiBm
dW5jdGlvbiwgd2Ugd2lsbCByZW1vdmUgdGhlIHVzYWdlIG9mIGF0dGFjaF9wYWdlX2J1ZmZlcnMK
YW5kICBfX2NsZWFyX3BhZ2VfYnVmZmVycyBpbiBuZXh0IHBhdGNoZXMuIFRoYW5rcyBmb3Igc3Vn
Z2VzdGlvbnMgYWJvdXQKdGhlIGZ1bmN0aW9uIG5hbWUgZnJvbSBBbGV4YW5kZXIgVmlybywgQW5k
cmVhcyBHcsO8bmJhY2hlciwgQ2hyaXN0b3BoCkhlbGx3aWcgYW5kIE1hdHRoZXcgV2lsY294LgoK
U3VnZ2VzdGVkLWJ5OiBNYXR0aGV3IFdpbGNveCA8d2lsbHlAaW5mcmFkZWFkLm9yZz4KQ2M6IEFu
ZHJldyBNb3J0b24gPGFrcG1AbGludXgtZm91bmRhdGlvbi5vcmc+CkNjOiAiRGFycmljayBKLiBX
b25nIiA8ZGFycmljay53b25nQG9yYWNsZS5jb20+CkNjOiBXaWxsaWFtIEt1Y2hhcnNraSA8d2ls
bGlhbS5rdWNoYXJza2lAb3JhY2xlLmNvbT4KQ2M6ICJLaXJpbGwgQS4gU2h1dGVtb3YiIDxraXJp
bGwuc2h1dGVtb3ZAbGludXguaW50ZWwuY29tPgpDYzogQW5kcmVhcyBHcnVlbmJhY2hlciA8YWdy
dWVuYmFAcmVkaGF0LmNvbT4KQ2M6IFlhbmcgU2hpIDx5YW5nLnNoaUBsaW51eC5hbGliYWJhLmNv
bT4KQ2M6IFlhZmFuZyBTaGFvIDxsYW9hci5zaGFvQGdtYWlsLmNvbT4KQ2M6IFNvbmcgTGl1IDxz
b25nQGtlcm5lbC5vcmc+CkNjOiBsaW51eC1yYWlkQHZnZXIua2VybmVsLm9yZwpDYzogQ2hyaXMg
TWFzb24gPGNsbUBmYi5jb20+CkNjOiBKb3NlZiBCYWNpayA8am9zZWZAdG94aWNwYW5kYS5jb20+
CkNjOiBEYXZpZCBTdGVyYmEgPGRzdGVyYmFAc3VzZS5jb20+CkNjOiBsaW51eC1idHJmc0B2Z2Vy
Lmtlcm5lbC5vcmcKQ2M6IEFsZXhhbmRlciBWaXJvIDx2aXJvQHplbml2LmxpbnV4Lm9yZy51az4K
Q2M6IEphZWdldWsgS2ltIDxqYWVnZXVrQGtlcm5lbC5vcmc+CkNjOiBDaGFvIFl1IDxjaGFvQGtl
cm5lbC5vcmc+CkNjOiBsaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApDYzog
Q2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBpbmZyYWRlYWQub3JnPgpDYzogbGludXgteGZzQHZnZXIu
a2VybmVsLm9yZwpDYzogQW50b24gQWx0YXBhcm1ha292IDxhbnRvbkB0dXhlcmEuY29tPgpDYzog
bGludXgtbnRmcy1kZXZAbGlzdHMuc291cmNlZm9yZ2UubmV0CkNjOiBNaWtlIE1hcnNoYWxsIDxo
dWJjYXBAb21uaWJvbmQuY29tPgpDYzogTWFydGluIEJyYW5kZW5idXJnIDxtYXJ0aW5Ab21uaWJv
bmQuY29tPgpDYzogZGV2ZWxAbGlzdHMub3JhbmdlZnMub3JnCkNjOiBUaG9tYXMgR2xlaXhuZXIg
PHRnbHhAbGludXRyb25peC5kZT4KQ2M6IFNlYmFzdGlhbiBBbmRyemVqIFNpZXdpb3IgPGJpZ2Vh
c3lAbGludXRyb25peC5kZT4KQ2M6IFJvbWFuIEd1c2hjaGluIDxndXJvQGZiLmNvbT4KQ2M6IEFu
ZHJlYXMgRGlsZ2VyIDxhZGlsZ2VyQGRpbGdlci5jYT4KU2lnbmVkLW9mZi1ieTogR3VvcWluZyBK
aWFuZyA8Z3VvcWluZy5qaWFuZ0BjbG91ZC5pb25vcy5jb20+Ci0tLQpObyBjaGFuZ2Ugc2luY2Ug
UkZDIFYzLgoKUkZDIFYyIC0+IFJGQyBWMzoKMS4gcmVuYW1lIGNsZWFyX3BhZ2VfcHJpdmF0ZSB0
byBkZXRhY2hfcGFnZV9wcml2YXRlLgoyLiB1cGRhdGVkIHRoZSBjb21tZW50cyBmb3IgdGhlIHR3
byBmdW5jdGlvbnMuCgpSRkMgLT4gUkZDIFYyOiAgQWRkcmVzcyB0aGUgY29tbWVudHMgZnJvbSBD
aHJpc3RvcGggSGVsbHdpZwoxLiBjaGFuZ2UgZnVuY3Rpb24gbmFtZXMgdG8gYXR0YWNoL2NsZWFy
X3BhZ2VfcHJpdmF0ZSBhbmQgYWRkIGNvbW1lbnRzLgoyLiBjaGFuZ2UgdGhlIHJldHVybiB0eXBl
IG9mIGF0dGFjaF9wYWdlX3ByaXZhdGUuCgogaW5jbHVkZS9saW51eC9wYWdlbWFwLmggfCAzNyAr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMzcg
aW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvcGFnZW1hcC5oIGIvaW5j
bHVkZS9saW51eC9wYWdlbWFwLmgKaW5kZXggYzYzNDhjNTAxMzZmLi44ZTA4NTcxMzE1MGMgMTAw
NjQ0Ci0tLSBhL2luY2x1ZGUvbGludXgvcGFnZW1hcC5oCisrKyBiL2luY2x1ZGUvbGludXgvcGFn
ZW1hcC5oCkBAIC0yMDgsNiArMjA4LDQzIEBAIHN0YXRpYyBpbmxpbmUgaW50IHBhZ2VfY2FjaGVf
YWRkX3NwZWN1bGF0aXZlKHN0cnVjdCBwYWdlICpwYWdlLCBpbnQgY291bnQpCiAJcmV0dXJuIF9f
cGFnZV9jYWNoZV9hZGRfc3BlY3VsYXRpdmUocGFnZSwgY291bnQpOwogfQogCisvKioKKyAqIGF0
dGFjaF9wYWdlX3ByaXZhdGUgLSBBdHRhY2ggcHJpdmF0ZSBkYXRhIHRvIGEgcGFnZS4KKyAqIEBw
YWdlOiBQYWdlIHRvIGF0dGFjaCBkYXRhIHRvLgorICogQGRhdGE6IERhdGEgdG8gYXR0YWNoIHRv
IHBhZ2UuCisgKgorICogQXR0YWNoaW5nIHByaXZhdGUgZGF0YSB0byBhIHBhZ2UgaW5jcmVtZW50
cyB0aGUgcGFnZSdzIHJlZmVyZW5jZSBjb3VudC4KKyAqIFRoZSBkYXRhIG11c3QgYmUgZGV0YWNo
ZWQgYmVmb3JlIHRoZSBwYWdlIHdpbGwgYmUgZnJlZWQuCisgKi8KK3N0YXRpYyBpbmxpbmUgdm9p
ZCBhdHRhY2hfcGFnZV9wcml2YXRlKHN0cnVjdCBwYWdlICpwYWdlLCB2b2lkICpkYXRhKQorewor
CWdldF9wYWdlKHBhZ2UpOworCXNldF9wYWdlX3ByaXZhdGUocGFnZSwgKHVuc2lnbmVkIGxvbmcp
ZGF0YSk7CisJU2V0UGFnZVByaXZhdGUocGFnZSk7Cit9CisKKy8qKgorICogZGV0YWNoX3BhZ2Vf
cHJpdmF0ZSAtIERldGFjaCBwcml2YXRlIGRhdGEgZnJvbSBhIHBhZ2UuCisgKiBAcGFnZTogUGFn
ZSB0byBkZXRhY2ggZGF0YSBmcm9tLgorICoKKyAqIFJlbW92ZXMgdGhlIGRhdGEgdGhhdCB3YXMg
cHJldmlvdXNseSBhdHRhY2hlZCB0byB0aGUgcGFnZSBhbmQgZGVjcmVtZW50cworICogdGhlIHJl
ZmNvdW50IG9uIHRoZSBwYWdlLgorICoKKyAqIFJldHVybjogRGF0YSB0aGF0IHdhcyBhdHRhY2hl
ZCB0byB0aGUgcGFnZS4KKyAqLworc3RhdGljIGlubGluZSB2b2lkICpkZXRhY2hfcGFnZV9wcml2
YXRlKHN0cnVjdCBwYWdlICpwYWdlKQoreworCXZvaWQgKmRhdGEgPSAodm9pZCAqKXBhZ2VfcHJp
dmF0ZShwYWdlKTsKKworCWlmICghUGFnZVByaXZhdGUocGFnZSkpCisJCXJldHVybiBOVUxMOwor
CUNsZWFyUGFnZVByaXZhdGUocGFnZSk7CisJc2V0X3BhZ2VfcHJpdmF0ZShwYWdlLCAwKTsKKwlw
dXRfcGFnZShwYWdlKTsKKworCXJldHVybiBkYXRhOworfQorCiAjaWZkZWYgQ09ORklHX05VTUEK
IGV4dGVybiBzdHJ1Y3QgcGFnZSAqX19wYWdlX2NhY2hlX2FsbG9jKGdmcF90IGdmcCk7CiAjZWxz
ZQotLSAKMi4xNy4xCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlz
dHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xp
c3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
