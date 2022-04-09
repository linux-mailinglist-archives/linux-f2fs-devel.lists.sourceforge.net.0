Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BF8994FA901
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  9 Apr 2022 16:33:27 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ndC9S-0007Xe-1I; Sat, 09 Apr 2022 14:33:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <colyli@suse.de>)
 id 1ndC9P-0007XJ-MJ; Sat, 09 Apr 2022 14:33:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BmOfl4NqddautzOtQrZ0dLuhiQSp1fB0SDxF8v7gYBA=; b=nMP6ett/usWt6E79RJvK7cRV8U
 fRHKY3zEJ7q2buOCKfu5NLj5EBSYO8OlFJSN2EgdouoIAPk+RRE34FvezhjPgr+wouVs2GEFKtQG8
 HcjUcoOugBq662WhDe8Y35Ep4NAKMd6pL4endHeadXAj2Fj1StxYjvV8+mEhDRSjHua4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=BmOfl4NqddautzOtQrZ0dLuhiQSp1fB0SDxF8v7gYBA=; b=Bz8bGyNYrwiEHLGkZkWh4SISEs
 ZGEBC1g4giZHfx90rfb0ml80oTqqGvDXvunAjmcMLhurIgcAXePot1O8puC36PAf4wGeFJ6tRWo9u
 TOTGep+WG1/U+e9J4ZtQPuQ3r1sDwtN0rM0RlQWn9tH8jKcM4DT0Pi3T2CLDSd+X+TqU=;
Received: from smtp-out2.suse.de ([195.135.220.29])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1ndC9M-00AtQx-Bd; Sat, 09 Apr 2022 14:33:18 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 207A11F864;
 Sat,  9 Apr 2022 14:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1649514786; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BmOfl4NqddautzOtQrZ0dLuhiQSp1fB0SDxF8v7gYBA=;
 b=SJlQufjnXjTQtqgkhM6MsOUPDPwOMZ6xGLQ76UNS6RR1cEGIg2CW/GZ7A0Nq9xE2LKzjCQ
 zm4gbJFRwGS5ZR58/OOlzltxzH57NlfDQ1MS9kgXiNk7elM8N3NSClk0AEwvrheO6NCJzw
 l51uuNG8cURr+Q1l6/il4XbIWcEO2Fg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1649514786;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BmOfl4NqddautzOtQrZ0dLuhiQSp1fB0SDxF8v7gYBA=;
 b=yiH+qx8I6hbeCP31rtrhbZE5qxMo8OqYiXG+UWOpJ9wghAOQqadl62X34RS7V0fnDyonaX
 HzX10h1d2uotqQBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3F41913AA1;
 Sat,  9 Apr 2022 14:32:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id m2GpARiZUWLHIgAAMHmgww
 (envelope-from <colyli@suse.de>); Sat, 09 Apr 2022 14:32:56 +0000
Message-ID: <f01ac878-9b0d-972b-70dc-6f3f61b9947b@suse.de>
Date: Sat, 9 Apr 2022 22:32:52 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Content-Language: en-US
To: Christoph Hellwig <hch@lst.de>
References: <20220409045043.23593-1-hch@lst.de>
 <20220409045043.23593-27-hch@lst.de>
From: Coly Li <colyli@suse.de>
In-Reply-To: <20220409045043.23593-27-hch@lst.de>
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 4/9/22 12:50 PM, Christoph Hellwig wrote: > Secure erase
 is a very different operation from discard in that it is > a data integrity
 operation vs hint. Fully split the limits and helper > infrastru [...] 
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.220.29 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -2.8 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1ndC9M-00AtQx-Bd
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
 linux-um@lists.infradead.org, nbd@other.debian.org,
 linux-block@vger.kernel.org, linux-bcache@vger.kernel.org,
 David Sterba <dsterba@suse.com>, ceph-devel@vger.kernel.org,
 Ryusuke Konishi <konishi.ryusuke@gmail.com>, Jens Axboe <axboe@kernel.dk>,
 linux-raid@vger.kernel.org, "Martin K . Petersen" <martin.petersen@oracle.com>,
 linux-mmc@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org,
 =?UTF-8?Q?Christoph_B=c3=b6hmwalder?= <christoph.boehmwalder@linbit.com>,
 ocfs2-devel@oss.oracle.com, linux-fsdevel@vger.kernel.org,
 ntfs3@lists.linux.dev, linux-btrfs@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gNC85LzIyIDEyOjUwIFBNLCBDaHJpc3RvcGggSGVsbHdpZyB3cm90ZToKPiBTZWN1cmUgZXJh
c2UgaXMgYSB2ZXJ5IGRpZmZlcmVudCBvcGVyYXRpb24gZnJvbSBkaXNjYXJkIGluIHRoYXQgaXQg
aXMKPiBhIGRhdGEgaW50ZWdyaXR5IG9wZXJhdGlvbiB2cyBoaW50LiAgRnVsbHkgc3BsaXQgdGhl
IGxpbWl0cyBhbmQgaGVscGVyCj4gaW5mcmFzdHJ1Y3R1cmUgdG8gbWFrZSB0aGUgc2VwYXJhdGlv
biBtb3JlIGNsZWFyLgo+Cj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBs
c3QuZGU+Cj4gUmV2aWV3ZWQtYnk6IE1hcnRpbiBLLiBQZXRlcnNlbiA8bWFydGluLnBldGVyc2Vu
QG9yYWNsZS5jb20+Cj4gQWNrZWQtYnk6IENocmlzdG9waCBCw7ZobXdhbGRlciA8Y2hyaXN0b3Bo
LmJvZWhtd2FsZGVyQGxpbmJpdC5jb20+IFtkcmJkXQo+IEFja2VkLWJ5OiBSeXVzdWtlIEtvbmlz
aGkgPGtvbmlzaGkucnl1c3VrZUBnbWFpbC5jb20+IFtuaWZzMl0KPiBBY2tlZC1ieTogQ29seSBM
aSA8Y29seWxpQHN1c2UuZGU+IFtkcmJkXQoKSGkgQ2hyaXN0b3BoLAoKTXkgQUNLIGlzIGZvciBi
Y2FjaGUsIG5vdCBkcmJkIGhlcmUuCgpUaGFua3MuCgoKQ29seSBMaQoKCgo+IEFja2VkLWJ5OiBE
YXZpZCBTdGVyYmEgPGRzdGVyYmFAc3VzZS5jb20+IFtidHJmc10KCgoKCgoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFp
bGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8v
bGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
