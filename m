Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EBAC3EB69F
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 13 Aug 2021 16:18:08 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mEY0a-0003VD-3C; Fri, 13 Aug 2021 14:18:04 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <frank.li@vivo.com>) id 1mEY0Y-0003V5-ID
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 13 Aug 2021 14:18:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Date:From:MIME-Version:In-Reply-To:Subject:Cc:To:
 Message-ID:Content-Transfer-Encoding:Content-Type:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QaykLfn1At6Vjs1MZj7fMDQeWo4CLY6KzFu2VwOSJsM=; b=hCaSueAQASSvw5WIYyJDtrjX+F
 SVeV/jtnIuIbPXeexeRPxWtghQWUgxPunPE55f1893j3Ah2BEGdIrLNimpkaUffnWZvdIHYnJqLXw
 0no57zFLR4V+DuyLaqsrW4ocR7mPM9oMMKgxs7CkU8UZ0kPPhtGIlBz/3oTqGH9pE9xM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Date:From:MIME-Version:In-Reply-To:Subject:Cc:To:Message-ID:
 Content-Transfer-Encoding:Content-Type:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QaykLfn1At6Vjs1MZj7fMDQeWo4CLY6KzFu2VwOSJsM=; b=WIgcVYdtKv3RMz+gpeGn+2n80v
 eDjQS+cCVl81CARRdMpLWZFm7piTiNfV11EYwDihJlZn1TktECSh69dQf0F7WW2EcSFHr44rg9ruj
 bhwiPH8nwl8jTrHInLBPux+140dEufpujCX5Jas6AHrcIR8BliKKV2O8t838b1yk0Aes=;
Received: from mail-m176236.qiye.163.com ([59.111.176.236])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mEY0V-0006Wx-8p
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 13 Aug 2021 14:18:02 +0000
Received: from vivo.com (localhost [127.0.0.1])
 by mail-m176236.qiye.163.com (Hmail) with ESMTP id D6BF2780146;
 Fri, 13 Aug 2021 22:17:49 +0800 (CST)
Message-ID: <AKcA0QDJDw7c2rSjY0-LUKqD.3.1628864269869.Hmail.frank.li@vivo.com>
To: Chao Yu <chao@kernel.org>
X-Priority: 3
X-Mailer: HMail Webmail Server V2.0 Copyright (c) 2016-163.com
X-Originating-IP: 58.251.74.231
In-Reply-To: <78fcfb53-66ec-b383-8477-3f25ee13f962@kernel.org>
MIME-Version: 1.0
Received: from frank.li@vivo.com( [58.251.74.231) ] by ajax-webmail (
 [127.0.0.1] ) ; Fri, 13 Aug 2021 22:17:49 +0800 (GMT+08:00)
From: =?UTF-8?B?5p2O5oms6Z+s?= <frank.li@vivo.com>
Date: Fri, 13 Aug 2021 22:17:49 +0800 (GMT+08:00)
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZCBgUCR5ZQVlLVUtZV1
 kWDxoPAgseWUFZKDYvK1lXWShZQUhPN1dZLVlBSVdZDwkaFQgSH1lBWRkfH0lWT0gYT05OGBgaQx
 9PVRMBExYaEhckFA4PWVdZFhoPEhUdFFlBWU9LSFVKSktISkxVS1kG
X-HM-Sender-Digest: e1kJHlYWEh9ZQU1OQkNLS0tJSkhJN1dZDB4ZWUEPCQ4eV1kSHx4VD1lB
 WUc6MBg6Syo*MT8MTBhJCSgRIktWNy4wCj9VSFVKTUlDQ01PSUxLSE9PVTMWGhIXVR0JGhUQVRcS
 Ow0SDRRVGBQWRVlXWRILWUFZTkNVSU5KVUxPVUlISllXWQgBWUFJTU5CNwY+
X-HM-Tid: 0a7b3fe04e39d9aekuwsd6bf2780146
X-Spam-Score: 0.5 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: vivo.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [59.111.176.236 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [59.111.176.236 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 MSGID_FROM_MTA_HEADER  Message-Id was added by a relay
 0.5 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1mEY0V-0006Wx-8p
Subject: Re: [f2fs-dev] 
 =?utf-8?q?=5BPATCH=5D_f2fs=3A_convert_/sys/fs/f2fs/?=
 =?utf-8?q?=3Cdisk=3E/stat/sb=5Fstatus_to_use_string?=
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
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

SEkgQ2hhbywKCkZyb206IENoYW8gWXUgPGNoYW9Aa2VybmVsLm9yZz4KRGF0ZTogMjAyMS0wOC0x
MyAyMjowOTo1MwpUbzogIFlhbmd0YW8gTGkgPGZyYW5rLmxpQHZpdm8uY29tPixqYWVnZXVrQGtl
cm5lbC5vcmcKQ2M6ICBsaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldCxsaW51
eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnClN1YmplY3Q6IFJlOiBbUEFUQ0hdIGYyZnM6IGNvbnZl
cnQgL3N5cy9mcy9mMmZzLzxkaXNrPi9zdGF0L3NiX3N0YXR1cyB0byB1c2Ugc3RyaW5nPk9uIDIw
MjEvOC8xMyAyMjowMSwgWWFuZ3RhbyBMaSB3cm90ZToKPj4gRG8gbm90IHVzZSBudW1iZXJzIGJ1
dCBzdHJpbmdzIHRvIGltcHJvdmUgcmVhZGFiaWxpdHkgd2hlbiBmbGFnIGlzIHNldC4KPgo+VGhp
cyBicmVha3Mgb3V0cHV0IHJ1bGUgb2Ygc3lzZnMgZW50cnksIHNlZSBiZWxvdyBsaW5rOgo+Cldo
aWNoIHJ1bGU/IG9uZSBlbnRyeSBzaG91bGQgc2hvdyBvbmUgdmFsdWXvvJ8KCkJ1dCBJIHNlZSB0
aGF0OgojIGNhdCAvc3lzL2ZzL2YyZnMvPGRpc2s+L2ZlYXR1cmVzCmVuY3J5cHRpb24sIHF1b3Rh
X2lubywgdmVyaXR5LCBwaW5fZmlsZQoKU28gdGhlIGZvcm1hdCBvZiBmZWF0dXJlcyBhbHNvIHdy
b25nPwoKVGh477yMDQoNCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxp
c3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9s
aXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
