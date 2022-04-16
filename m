Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FBDA503265
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 16 Apr 2022 04:29:24 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nfYBb-0001nV-2t; Sat, 16 Apr 2022 02:29:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>)
 id 1nfYBZ-0001nL-P7; Sat, 16 Apr 2022 02:29:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VxCCA1if4MjVywiRC7EnrE+nphBnU8HHnT6e+P2TXkQ=; b=VhchyIyY4tgw2BU8VB6oqdPFSQ
 OO67hrfm+aFwFV8aK4Kiy24b0mznrGFcj8clR1Q4DZJXWC6AYnEXS2+ENbERRd0ElHLQ5kBx+OZ8A
 q891M3zV9lv+InzXCr8dJRJJx3nSPj4j0wRmDrDg2biPPc4FMuQHwsvMNRfU4D2PMg/c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=VxCCA1if4MjVywiRC7EnrE+nphBnU8HHnT6e+P2TXkQ=; b=GQLNOFpeZwxMqHYxngj5YcNl7m
 jBkxQYxnYL13k01HM0LlagP1iJM1kRHVEJj2CBiv9/4fFT81MIkicGMDztgOJFpcsyqGCG6zyGHuD
 LURHhPLYIrXL2R7QL5SdHEpuJ2AWI7BJSRMBBCv1LvKlDHYsEipb2Mk/6YMZb2OlTkNU=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nfYBX-0005Dg-HI; Sat, 16 Apr 2022 02:29:16 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 2FF20B82E4A;
 Sat, 16 Apr 2022 02:29:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49BEAC385A9;
 Sat, 16 Apr 2022 02:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650076142;
 bh=64fC476XAzTfqTSPn+hnDLb+pMKn+pGg/cu9T2ZYoeo=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=YR2swQd5bHjAFWTiUHuzi2CBAoBviVOC618ZH6KrZjKGz54+nb14CQuuZA/rg7rT4
 HOUGUM1/um4+uLyDQbz+2PZe7eFGngBlsNfmtF55BEnpI8SeGgAW1TB9RPEF0hZ/gu
 wadS+mRuD6cvw4fVgc6pYN09yVoj6blhm7pLMwx6SJQPqerB95uO3eDsfGVZkI1tAT
 ypjbfbxn7+bT/FWjnusepnTR0gEoGRsC/NgAvlwAmFKhGsjLJGRbec9W3gsrNwS1xO
 /N5W0GD6Xr6BMAFslHSxbnYfv+w/HrqJWAmw3dvOKrGV8WDuaNAVrqQjvW1ASku3np
 CHDdJgFxl65YQ==
Message-ID: <ffa14a07-b8f9-828e-97bc-cf7a2099bab5@kernel.org>
Date: Sat, 16 Apr 2022 10:28:49 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-US
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
References: <20220415045258.199825-1-hch@lst.de>
 <20220415045258.199825-27-hch@lst.de>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20220415045258.199825-27-hch@lst.de>
X-Spam-Score: -9.1 (---------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/4/15 12:52, Christoph Hellwig wrote: > Secure erase
 is a very different operation from discard in that it is > a data integrity
 operation vs hint. Fully split the limits and helper > infrastru [...] 
 Content analysis details:   (-9.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -3.9 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nfYBX-0005Dg-HI
Subject: Re: [f2fs-dev] [PATCH 26/27] block: decouple REQ_OP_SECURE_ERASE
 from REQ_OP_DISCARD
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
 linux-um@lists.infradead.org, Coly Li <colyli@suse.de>,
 linux-block@vger.kernel.org, linux-bcache@vger.kernel.org,
 David Sterba <dsterba@suse.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 ceph-devel@vger.kernel.org, nbd@other.debian.org,
 Ryusuke Konishi <konishi.ryusuke@gmail.com>, linux-raid@vger.kernel.org,
 "Martin K . Petersen" <martin.petersen@oracle.com>, linux-mmc@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 =?UTF-8?Q?Christoph_B=c3=b6hmwalder?= <christoph.boehmwalder@linbit.com>,
 linux-btrfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 ntfs3@lists.linux.dev, ocfs2-devel@oss.oracle.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyMi80LzE1IDEyOjUyLCBDaHJpc3RvcGggSGVsbHdpZyB3cm90ZToKPiBTZWN1cmUgZXJh
c2UgaXMgYSB2ZXJ5IGRpZmZlcmVudCBvcGVyYXRpb24gZnJvbSBkaXNjYXJkIGluIHRoYXQgaXQg
aXMKPiBhIGRhdGEgaW50ZWdyaXR5IG9wZXJhdGlvbiB2cyBoaW50LiAgRnVsbHkgc3BsaXQgdGhl
IGxpbWl0cyBhbmQgaGVscGVyCj4gaW5mcmFzdHJ1Y3R1cmUgdG8gbWFrZSB0aGUgc2VwYXJhdGlv
biBtb3JlIGNsZWFyLgo+IAo+IFNpZ25lZC1vZmYtYnk6IENocmlzdG9waCBIZWxsd2lnIDxoY2hA
bHN0LmRlPgo+IFJldmlld2VkLWJ5OiBNYXJ0aW4gSy4gUGV0ZXJzZW4gPG1hcnRpbi5wZXRlcnNl
bkBvcmFjbGUuY29tPgo+IEFja2VkLWJ5OiBDaHJpc3RvcGggQsO2aG13YWxkZXIgPGNocmlzdG9w
aC5ib2VobXdhbGRlckBsaW5iaXQuY29tPiBbZHJiZF0KPiBBY2tlZC1ieTogUnl1c3VrZSBLb25p
c2hpIDxrb25pc2hpLnJ5dXN1a2VAZ21haWwuY29tPiBbbmlmczJdCj4gQWNrZWQtYnk6IEphZWdl
dWsgS2ltIDxqYWVnZXVrQGtlcm5lbC5vcmc+IFtmMmZzXQo+IEFja2VkLWJ5OiBDb2x5IExpIDxj
b2x5bGlAc3VzZS5kZT4gW2JjYWNoZV0KPiBBY2tlZC1ieTogRGF2aWQgU3RlcmJhIDxkc3RlcmJh
QHN1c2UuY29tPiBbYnRyZnNdCgpGb3IgZjJmcyBwYXJ0LAoKQWNrZWQtYnk6IENoYW8gWXUgPGNo
YW9Aa2VybmVsLm9yZz4KClRoYW5rcywKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZz
LWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5l
dC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
