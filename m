Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ACE1633687
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 22 Nov 2022 09:02:43 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oxOEl-0007G3-9Z;
	Tue, 22 Nov 2022 08:02:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1oxOEI-0007Fg-TT
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 22 Nov 2022 08:02:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 Subject:From:References:To:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/t9KjP8SadZGhGs7wqcnztHMfd5BQeq0kCZWzpqEPsk=; b=lEK73Lb4FVKHGRaSlZ5t2Q9uqJ
 dwerJaOdZblFnEII16Qsqy5XZisVFaf7qS84kPD2L/aq5U/l4yZb4KqkrEgDk88UbKZp9wj14hMAe
 iJnkvhBNUON3Lnmg+iZgnI/DV7IJ2++LlcfuKNF1nYm93jEBjejOnfKegLSwCVpPVvv8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:From:
 References:To:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/t9KjP8SadZGhGs7wqcnztHMfd5BQeq0kCZWzpqEPsk=; b=gnj6LxTasalNdQe8XZdxq4//Od
 Qkjy2fIOIC4n4u0ZkXbhrGrR57fQRMCWIPMEPVFwHfxINxF/K2+VjIzhTgaL+ZI9msZFRaYO1Ni67
 SaiaCv9mcFnyc05RrKK5BBasw76jEogoQL1TQgUELgCVohkYLZkno01TOWfPVz4PFUd0=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oxOEG-0002sF-UU for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 22 Nov 2022 08:02:06 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A443EB8198D;
 Tue, 22 Nov 2022 08:01:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F8DDC433D6;
 Tue, 22 Nov 2022 08:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669104117;
 bh=NOXarNOHdXXBuICnUwVDtYZMYcKMQ/aOjAW33SMD19w=;
 h=Date:To:References:From:Subject:In-Reply-To:From;
 b=UkOQD0PxLUVkb/17jR6J3yNTjiACQgT6mFyn0h2nbzFWnb4Msp9nyVjr/U/A2rwMY
 MlspqpX8BEVAFsXs/u8yr3GBABMjimM3oMeZzzmkC9/OmmDB/xmXB2MRU52UxdgF8W
 quMFacZaopt5I0zbdIijV7c7WIxRIi4yqnkQ9m2uPvVTkqNoE1OxRZiFz8GVSiuEpB
 SIT+7XlHt7AKiCmUeuNBGRKsHXAs3T1HwsR13T/oQ3jtHzE9EZe0pHH7Uq/ssslV3w
 MnwLK6Q4oJrkouN48auHLbM/Q5qTrpVhjMACkw/y56W4/6R33aeYjwXrkM3O8J21jZ
 qCb7Y48Sx/RhA==
Message-ID: <af5ae747-5552-aeb0-885e-ddc9ab6f39c3@kernel.org>
Date: Tue, 22 Nov 2022 16:01:54 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
To: yonggil.song@samsung.com, "jaegeuk@kernel.org" <jaegeuk@kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <CGME20221102100756epcms2p23dfabe90c467313ce094c5c81a99c6d7@epcms2p4>
 <20221122023656epcms2p4468d4feb97711516206e19890dad09ac@epcms2p4>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20221122023656epcms2p4468d4feb97711516206e19890dad09ac@epcms2p4>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Hi Yonggil, I guess your email client forces converting tab
    and space characters of patch, please check that. On 2022/11/22 10:36, Yonggil
    Song wrote: > When f2fs chooses GC victim in large section & LFS mode,
    > next_victim_seg[gc_type] is referenced first. After segment is freed,
    > next_vict [...] 
 
 Content analysis details:   (-5.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
                             high trust
                             [145.40.68.75 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oxOEG-0002sF-UU
Subject: Re: [f2fs-dev] [PATCH v1] f2fs: avoid victim selection from
 previous victim section
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

SGkgWW9uZ2dpbCwKCkkgZ3Vlc3MgeW91ciBlbWFpbCBjbGllbnQgZm9yY2VzIGNvbnZlcnRpbmcg
dGFiIGFuZCBzcGFjZSBjaGFyYWN0ZXJzIG9mCnBhdGNoLCBwbGVhc2UgY2hlY2sgdGhhdC4KCk9u
IDIwMjIvMTEvMjIgMTA6MzYsIFlvbmdnaWwgU29uZyB3cm90ZToKPiBXaGVuwqBmMmZzwqBjaG9v
c2VzwqBHQ8KgdmljdGltwqBpbsKgbGFyZ2XCoHNlY3Rpb27CoCbCoExGU8KgbW9kZSwKPiBuZXh0
X3ZpY3RpbV9zZWdbZ2NfdHlwZV3CoGlzwqByZWZlcmVuY2VkwqBmaXJzdC7CoEFmdGVywqBzZWdt
ZW50wqBpc8KgZnJlZWQsCj4gbmV4dF92aWN0aW1fc2VnW2djX3R5cGVdwqBoYXPCoHRoZcKgbmV4
dMKgc2VnbWVudMKgbnVtYmVyLgo+IEhvd2V2ZXIswqBuZXh0X3ZpY3RpbV9zZWdbZ2NfdHlwZV3C
oHN0aWxswqBoYXPCoHRoZcKgbGFzdMKgc2VnbWVudMKgbnVtYmVyCj4gZXZlbsKgYWZ0ZXLCoHRo
ZcKgbGFzdMKgc2VnbWVudMKgb2bCoHNlY3Rpb27CoGlzwqBmcmVlZC7CoEluwqB0aGlzwqBjYXNl
LMKgd2hlbsKgZjJmcwo+IGNob29zZXPCoGHCoHZpY3RpbcKgZm9ywqB0aGXCoG5leHTCoEdDwqBy
b3VuZCzCoHRoZcKgbGFzdMKgc2VnbWVudMKgb2bCoHByZXZpb3VzwqB2aWN0aW0KPiBzZWN0aW9u
wqBpc8KgY2hvc2VuwqBhc8KgYcKgdmljdGltLgo+IAo+IEluaXRpYWxpemXCoG5leHRfdmljdGlt
X3NlZ1tnY190eXBlXcKgdG/CoE5VTExfU0VHTk/CoGZvcsKgdGhlwqBsYXN0wqBzZWdtZW50wqBp
bgo+IGxhcmdlwqBzZWN0aW9uLgo+IAo+IEZpeGVzOiBlMzA4MGIwMTIwYTEgKCJmMmZzOiBzdXBw
b3J0IHN1YnNlY3Rpb25hbCBnYXJiYWdlIGNvbGxlY3Rpb24iKQoKR29vZCBjYXRjaCwgSSdtIGZp
bmUgd2l0aCB0aGlzIGZpeC4KClRoYW5rcywKCj4gU2lnbmVkLW9mZi1ieTrCoFlvbmdnaWzCoFNv
bmfCoDx5b25nZ2lsLnNvbmdAc2Ftc3VuZy5jb20+Cj4gLS0tCj4gIMKgZnMvZjJmcy9nYy5jwqB8
wqA1wqArKystLQo+ICDCoDHCoGZpbGXCoGNoYW5nZWQswqAzwqBpbnNlcnRpb25zKCspLMKgMsKg
ZGVsZXRpb25zKC0pCj4gCj4gZGlmZsKgLS1naXTCoGEvZnMvZjJmcy9nYy5jwqBiL2ZzL2YyZnMv
Z2MuYwo+IGluZGV4wqA0NTQ2ZTAxYjJlZTAuLjEwNjc3ZDUzZWYwZcKgMTAwNjQ0Cj4gLS0twqBh
L2ZzL2YyZnMvZ2MuYwo+ICsrK8KgYi9mcy9mMmZzL2djLmMKPiBAQMKgLTE3NDQsOMKgKzE3NDQs
OcKgQEDCoHN0YXRpY8KgaW50wqBkb19nYXJiYWdlX2NvbGxlY3Qoc3RydWN0wqBmMmZzX3NiX2lu
Zm/CoCpzYmksCj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoGdldF92YWxpZF9ibG9ja3Moc2JpLMKgc2Vnbm8swqBmYWxz
ZSnCoD09wqAwKQo+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoHNlZ19mcmVlZCsrOwo+ICAgCj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgaWbCoChfX2lzX2xhcmdlX3NlY3Rpb24oc2JpKcKgJibCoHNlZ25vwqArwqAxwqA8wqBlbmRf
c2Vnbm8pCj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oHNiaS0+bmV4dF92aWN0aW1fc2VnW2djX3R5cGVdwqA9wqBzZWdub8KgK8KgMTsKPiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpZsKgKF9faXNfbGFyZ2Vfc2VjdGlvbihzYmkpKQo+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBzYmktPm5l
eHRfdmljdGltX3NlZ1tnY190eXBlXcKgPQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgKHNlZ25vwqArwqAxwqA8wqBlbmRf
c2Vnbm8pwqA/wqBzZWdub8KgK8KgMcKgOsKgTlVMTF9TRUdOTzsKPiAgwqBza2lwOgo+ICDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZjJmc19wdXRfcGFnZShzdW1fcGFnZSzCoDAp
Owo+ICDCoMKgwqDCoMKgwqDCoMKgwqB9Cj4gLS0gCj4gMi4zNC4xCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5n
IGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0
cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
