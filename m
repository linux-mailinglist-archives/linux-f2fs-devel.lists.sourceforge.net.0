Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B31241BE45B
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 29 Apr 2020 18:53:25 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jTpxW-0005Ce-W5; Wed, 29 Apr 2020 16:53:18 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <bounce+103f7e.be9e4a-linux-f2fs-devel=lists.sourceforge.net@mg.codeaurora.org>)
 id 1jTpxW-0005CN-0z
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 29 Apr 2020 16:53:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xhYN2QWZK+xOvZ83m2HJKcXlXIC6qwCWYYV5qQiwaZg=; b=TjyS57KWaz6AjRyt3eBkbZJUie
 cxxblC+lu961xROW1+dUpDRBEnE4tmzYXJIFl+Oo+LuJdRbz5v5xpQkCAQsUN7R1RLN8OLO4lpk4y
 Jwfc0BtTfKW1OXcOoBEcVaQkERswhZNuoVO2x0AzZ/7FSv04n1+xbNLlcmHQD2xC8Kkc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xhYN2QWZK+xOvZ83m2HJKcXlXIC6qwCWYYV5qQiwaZg=; b=ZYK9WTSsTgIqDDfvJFc+gKc8OG
 V2cnLlRK++fhJ+oK0XejieXMeCoHWU1o3uIL8JK5xQ/7S6qeugQnm2CS9bqHeCdPxzzd/NPV0v3dy
 JZs2mmVUeg2B2eN3AlYuRBHYsRnfPyFJdK/L+Gglh66FHvnVJsd9wm5PGhLguB4hB3GU=;
Received: from mail27.static.mailgun.info ([104.130.122.27])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jTpxR-002SE7-7W
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 29 Apr 2020 16:53:17 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1588179193; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=xhYN2QWZK+xOvZ83m2HJKcXlXIC6qwCWYYV5qQiwaZg=;
 b=vS7MMHGl9NgZ60nOXr6Zbd5mp+nPTw47qEbtT39ow92lteCcloF2iyFTVeEAVOdJnJsrLWpS
 bkvxUvB7S1cxDvUhg0BVvUwkjHfdxGJMmcmZFvJJLRb9O+PC01xXWjpAl3sSbQLaNjcOR9sd
 mYOR8//6q4KGWgma3Xz6yGi0cZ4=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI2M2Y4ZiIsICJsaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldCIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5ea9b0f0.7f67d8dc5490-smtp-out-n04;
 Wed, 29 Apr 2020 16:53:04 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 77052C433CB; Wed, 29 Apr 2020 16:53:04 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.0.102] (unknown [183.83.143.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: sayalil)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 8EAB0C433D2;
 Wed, 29 Apr 2020 16:53:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 8EAB0C433D2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=sayalil@codeaurora.org
To: Dan Carpenter <dan.carpenter@oracle.com>
References: <07a820a2-b3b3-32ca-75ce-ceaca106d2c6@web.de>
 <433d4ad5-22e5-fd2b-cab3-9752ed0c66fb@codeaurora.org>
 <20200429124402.GP2014@kadam>
From: Sayali Lokhande <sayalil@codeaurora.org>
Message-ID: <71c37cbb-03cd-134f-8b68-cf06bfa05317@codeaurora.org>
Date: Wed, 29 Apr 2020 22:22:58 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200429124402.GP2014@kadam>
Content-Language: en-US
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [104.130.122.27 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1jTpxR-002SE7-7W
Subject: Re: [f2fs-dev] [PATCH V2] f2fs: Avoid double lock for cp_rwsem
 during checkpoint
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, Markus Elfring <Markus.Elfring@web.de>,
 Jaegeuk Kim <jaegeuk@kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Ck9uIDQvMjkvMjAyMCA2OjE0IFBNLCBEYW4gQ2FycGVudGVyIHdyb3RlOgo+IE9uIFdlZCwgQXBy
IDI5LCAyMDIwIGF0IDEwOjI4OjM2QU0gKzA1MzAsIFNheWFsaSBMb2toYW5kZSB3cm90ZToKPj4g
SGkgTWFya3VzCj4+Cj4+IE9uIDQvMjcvMjAyMCA0OjA4IFBNLCBNYXJrdXMgRWxmcmluZyB3cm90
ZToKPj4+PiDigKYgVGhpcyByZXN1bHRzIGluIGRlYWRsb2NrIGFzCj4+Pj4gaXB1dCgpIHRyaWVz
IHRvIGhvbGQgY3BfcndzZW0sIHdoaWNoIGlzIGFscmVhZHkgaGVsZCBhdCB0aGUKPj4+PiBiZWdp
bm5pbmcgYnkgY2hlY2twb2ludC0+YmxvY2tfb3BlcmF0aW9ucygpLgo+Pj4gV2lsbCBhbm90aGVy
IGltcGVyYXRpdmUgd29yZGluZyBiZWNvbWUgaGVscGZ1bCBiZXNpZGVzIHRoZSBwcm92aWRlZCBp
bmZvcm1hdGlvbgo+Pj4gZm9yIHRoaXMgY2hhbmdlIGRlc2NyaXB0aW9uPwo+Pj4gaHR0cHM6Ly9n
aXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvdG9ydmFsZHMvbGludXguZ2l0
L3RyZWUvRG9jdW1lbnRhdGlvbi9wcm9jZXNzL3N1Ym1pdHRpbmctcGF0Y2hlcy5yc3Q/aWQ9NmE4
YjU1ZWQ0MDU2ZWE1NTU5ZWJlNGY2YTRiMjQ3ZjYyNzg3MGQ0YyNuMTUxCj4+Pgo+Pj4gV291bGQg
eW91IGxpa2UgdG8gYWRkIHRoZSB0YWcg4oCcRml4ZXPigJ0gYmVjYXVzZSBvZiBhZGp1c3RtZW50
cwo+Pj4gZm9yIHRoZSBkYXRhIHN5bmNocm9uaXNhdGlvbj8KPj4gSSBjb3VsZG4ndCBmaW5kIGFu
eSBwYXN0IGNvbW1pdCB3aGljaCBzdWl0cyB0byBiZSBhZGRlZCB1bmRlciAiRml4ZXMiIGhlcmUu
Cj4+IExldCBtZSBrbm93IGlmIHlvdSBoYXZlIGFueSBvdGhlciBjb21tZW50Lgo+IFRoaXMgbG9v
a3MgcmVhbGx5IG9sZC4gIE1heWJlIGNvbW1pdCAzOTkzNjgzNzJlZDkgKCJmMmZzOiBpbnRyb2R1
Y2UgYQo+IG5ldyBnbG9iYWwgbG9jayBzY2hlbWUiKT8KWWVzLiBMZXQgbWUgdXBkYXRlIGl0IGlu
IEZpeGVzIHRhZyBpbiBWMyBhbmQgcG9zdCBpdC4gVGhhbmtzIGZvciAKcG9pbnRpbmcgaXQuCj4K
PiByZWdhcmRzLAo+IGRhbiBjYXJwZW50ZXIKPgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4
LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9y
Z2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
