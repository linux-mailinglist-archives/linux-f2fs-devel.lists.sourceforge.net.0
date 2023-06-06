Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 67B647237E3
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  6 Jun 2023 08:40:51 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q6QN5-0006hJ-K1;
	Tue, 06 Jun 2023 06:40:47 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1q6QN4-0006hD-A6
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 06 Jun 2023 06:40:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7acdG8bZbeLpqS1WQu28iDqLksJudrtsYbqgegUEuqU=; b=UnH0sqPntetOKYKRQAVYMktooK
 CiC5RinTvCpmZqewAc/aXf91fJLEiWfjF3vdBoAzJaXOff2JtKkrw6RSOl8ec/falndsNFyKNykbV
 EPCYR0DQtZzjS+pvTfkNlHZ/00THF0z8rMZRKBKgeZ/v+3GHdST5bVRIzgCKjUTm6vBM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7acdG8bZbeLpqS1WQu28iDqLksJudrtsYbqgegUEuqU=; b=QVsWxp/6IFsNym0rpgYYp7jolF
 Cv2/xWkAln6nyLU6/6fVDSBYkfGH+ussyr2ooBrCWpq/jzdTUknxAtv/510buG3sp3yIWdrq2jC1A
 qABXqf8kXlHJZnO9BYw8Fk/+tfwv1lxufV2CtINqK/DPLjrMiB6t/xEbSirf32Q+7MW8=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q6QN1-00023n-RD for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 06 Jun 2023 06:40:45 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7266662956;
 Tue,  6 Jun 2023 06:40:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71BC0C433EF;
 Tue,  6 Jun 2023 06:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686033637;
 bh=Bc4xT3nI5CYlCloz6TBu1mtUbi94szMGgvZxxy0tVYg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Rjyte5kIcsFHmqfF+YX9Rw0ff33W8LAOFjXNpZNTRMA/2+ocj5k2uivmGlNj2WyUO
 vUD0UU7DYYV7ExjEUamA2L5Rtw6pFhNNv6utbvgX3Nol+oO3s+lYfhL9d6vS7T9HCo
 Ky8orgrROjSbOz/+G7haRhOgRlReQn5p+JhC6B3Uo1UuyWTDptbwV9WM7XY9wuN/1/
 8rc/fTcE/MXrzcXfWDnuo90aClU7ojdnK/K0PjldPSQHw1Jscq6q2fF8MOcJr02wj0
 npndYTC7Wiai3FaQmXJGRCv24lYuTR5s44Cv32igVcApf8k091qUs1t6WP4oG6BOfh
 5LoQCYZFVLUFg==
Message-ID: <20fb7157-05ae-eeb5-4acd-76b2c82d80b3@kernel.org>
Date: Tue, 6 Jun 2023 14:40:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>, Juhyung Park <qkrwngud825@gmail.com>
References: <20230531125918.55609-1-frank.li@vivo.com>
 <CAD14+f1YoiSVvq2M1v8u5bUdCNN_0nurY4ued6ZFu1gaBSHxDw@mail.gmail.com>
 <ZH48E4/AOtk1viOY@google.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <ZH48E4/AOtk1viOY@google.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/6/6 3:48, Jaegeuk Kim wrote: > On 05/31, Juhyung Park
 wrote: >> Hi Yangtao, >> >> I remember hearing that f2fs can perform relatively
 poorly under io_uring, >> nice find. >> >> I suggest rewri [...] 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1q6QN1-00023n-RD
Subject: Re: [f2fs-dev] [PATCH] f2fs: flag as supporting buffered async reads
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
Cc: linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 Lu Hongfei <luhongfei@vivo.com>, Yangtao Li <frank.li@vivo.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyMy82LzYgMzo0OCwgSmFlZ2V1ayBLaW0gd3JvdGU6Cj4gT24gMDUvMzEsIEp1aHl1bmcg
UGFyayB3cm90ZToKPj4gSGkgWWFuZ3RhbywKPj4KPj4gSSByZW1lbWJlciBoZWFyaW5nIHRoYXQg
ZjJmcyBjYW4gcGVyZm9ybSByZWxhdGl2ZWx5IHBvb3JseSB1bmRlciBpb191cmluZywKPj4gbmlj
ZSBmaW5kLgo+Pgo+PiBJIHN1Z2dlc3QgcmV3cml0aW5nIHRoZSBjb21taXQgbWVzc2FnZSB0aG91
Z2guIEZyb20gdGhlIGxvb2tzIG9mIGl0LCBpdAo+PiBtaWdodCBzdWdnZXN0IHRoYXQgRk1PREVf
QlVGX1JBU1lOQyBpcyBhIG1hZ2ljIGZsYWcgdGhhdCBhdXRvbWF0aWNhbGx5Cj4+IGltcHJvdmVz
IHBlcmZvcm1hbmNlIHRoYXQgY2FuIGJlIGVuYWJsZWQgd2lsbHkgbmlsbHkuCj4+Cj4+IEhvdyBh
Ym91dCBzb21ldGhpbmcgbGlrZToKPj4KPj4gZjJmcyB1c2VzIGdlbmVyaWNfZmlsZV9idWZmZXJl
ZF9yZWFkKCksIHdoaWNoIHN1cHBvcnRzIGJ1ZmZlcmVkIGFzeW5jCj4+IHJlYWRzIHNpbmNlIGNv
bW1pdCAxYTBhNzg1M2I5MDEgKCJtbTogc3VwcG9ydCBhc3luYyBidWZmZXJlZCByZWFkcyBpbgo+
PiBnZW5lcmljX2ZpbGVfYnVmZmVyZWRfcmVhZCgpIikuCj4gCj4gVGhhbmtzIEp1aHl1bmcsCj4g
Cj4gQXBwbGllZCB3aXRoIGEgbWlub3IgbW90aWZpY2F0aW9uIGJhc2VkIG9uIHlvdXJzLiA6KQoK
VGhlIHZlcnNpb24gaW4gZGV2LXRlc3QgYnJhbmNoIGxvb2tzIGdvb2QgdG8gbWUuCgpSZXZpZXdl
ZC1ieTogQ2hhbyBZdSA8Y2hhb0BrZXJuZWwub3JnPgoKVGhhbmtzLAoKPiAKPj4KPj4gTWF0Y2gg
b3RoZXIgZmlsZS1zeXN0ZW1zIGFuZCBlbmFibGUgaXQuIFRoZSByZWFkIHBlcmZvcm1hbmNlIGhh
cyBiZWVuCj4+IGdyZWF0bHkgaW1wcm92ZWQgdW5kZXIgaW9fdXJpbmc6Cj4+Cj4+ICAgICAgMTY3
TS9zIC0+IDIzNE0vcywgSW5jcmVhc2UgcmF0aW8gYnkgNDAlCj4+Cj4+IFRlc3Qgdy86Cj4+ICAg
ICAgLi9maW8gLS1uYW1lPW9uZXNzZCAtLWZpbGVuYW1lPS9kYXRhL3Rlc3QvbG9jYWwvaW9fdXJp
bmdfdGVzdAo+PiAgICAgIC0tc2l6ZT0yNTZNIC0tcnc9cmFuZHJlYWQgLS1icz00ayAtLWRpcmVj
dD0wIC0tb3ZlcndyaXRlPTAKPj4gICAgICAtLW51bWpvYnM9MSAtLWlvZGVwdGg9MSAtLXRpbWVf
YmFzZWQ9MCAtLXJ1bnRpbWU9MTAKPj4gICAgICAtLWlvZW5naW5lPWlvX3VyaW5nIC0tcmVnaXN0
ZXJmaWxlcyAtLWZpeGVkYnVmcwo+PiAgICAgIC0tZ3RvZF9yZWR1Y2U9MSAtLWdyb3VwX3JlcG9y
dGluZyAtLXNxdGhyZWFkX3BvbGw9MQo+Pgo+PiBPbiBXZWQsIE1heSAzMSwgMjAyMyBhdCAxMDow
MeKAr1BNIFlhbmd0YW8gTGkgdmlhIExpbnV4LWYyZnMtZGV2ZWwKPj4gPGxpbnV4LWYyZnMtZGV2
ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0PiB3cm90ZToKPj4+Cj4+PiBBZnRlciBlbmFibGluZyB0
aGlzIGZlYXR1cmUsIHRoZSByZWFkIHBlcmZvcm1hbmNlIGhhcyBiZWVuIGdyZWF0bHkKPj4+IGlt
cHJvdmVkOgo+Pj4KPj4+ICAgICAgMTY3TS9zIC0+IDIzNE0vcywgSW5jcmVhc2UgcmF0aW8gYnkg
NDAlCj4+Pgo+Pj4gVGVzdCB3LzoKPj4+ICAgICAgLi9maW8gLS1uYW1lPW9uZXNzZCAtLWZpbGVu
YW1lPS9kYXRhL3Rlc3QvbG9jYWwvaW9fdXJpbmdfdGVzdAo+Pj4gICAgICAtLXNpemU9MjU2TSAt
LXJ3PXJhbmRyZWFkIC0tYnM9NGsgLS1kaXJlY3Q9MCAtLW92ZXJ3cml0ZT0wCj4+PiAgICAgIC0t
bnVtam9icz0xIC0taW9kZXB0aD0xIC0tdGltZV9iYXNlZD0wIC0tcnVudGltZT0xMAo+Pj4gICAg
ICAtLWlvZW5naW5lPWlvX3VyaW5nIC0tcmVnaXN0ZXJmaWxlcyAtLWZpeGVkYnVmcwo+Pj4gICAg
ICAtLWd0b2RfcmVkdWNlPTEgLS1ncm91cF9yZXBvcnRpbmcgLS1zcXRocmVhZF9wb2xsPTEKPj4+
Cj4+PiBTaWduZWQtb2ZmLWJ5OiBMdSBIb25nZmVpIDxsdWhvbmdmZWlAdml2by5jb20+Cj4+PiBT
aWduZWQtb2ZmLWJ5OiBZYW5ndGFvIExpIDxmcmFuay5saUB2aXZvLmNvbT4KPj4+IC0tLQo+Pj4g
ICBmcy9mMmZzL2ZpbGUuYyB8IDIgKy0KPj4+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspLCAxIGRlbGV0aW9uKC0pCj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvZmlsZS5jIGIv
ZnMvZjJmcy9maWxlLmMKPj4+IGluZGV4IDAxNWVkMjc0ZGMzMS4uMjNjNjhlZTk0NmU1IDEwMDY0
NAo+Pj4gLS0tIGEvZnMvZjJmcy9maWxlLmMKPj4+ICsrKyBiL2ZzL2YyZnMvZmlsZS5jCj4+PiBA
QCAtNTQ2LDcgKzU0Niw3IEBAIHN0YXRpYyBpbnQgZjJmc19maWxlX29wZW4oc3RydWN0IGlub2Rl
ICppbm9kZSwgc3RydWN0IGZpbGUgKmZpbHApCj4+PiAgICAgICAgICBpZiAoZXJyKQo+Pj4gICAg
ICAgICAgICAgICAgICByZXR1cm4gZXJyOwo+Pj4KPj4+IC0gICAgICAgZmlscC0+Zl9tb2RlIHw9
IEZNT0RFX05PV0FJVDsKPj4+ICsgICAgICAgZmlscC0+Zl9tb2RlIHw9IEZNT0RFX05PV0FJVCB8
IEZNT0RFX0JVRl9SQVNZTkM7Cj4+Pgo+Pj4gICAgICAgICAgcmV0dXJuIGRxdW90X2ZpbGVfb3Bl
bihpbm9kZSwgZmlscCk7Cj4+PiAgIH0KPj4+IC0tCj4+PiAyLjM5LjAKPj4+Cj4+Pgo+Pj4KPj4+
IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4+PiBMaW51
eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdAo+Pj4gTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3Vy
Y2Vmb3JnZS5uZXQKPj4+IGh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3Rp
bmZvL2xpbnV4LWYyZnMtZGV2ZWwKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRl
dmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9s
aXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
