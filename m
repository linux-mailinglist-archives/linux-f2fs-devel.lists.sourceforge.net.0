Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C21B9AE89D3
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 25 Jun 2025 18:31:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:From:References:To:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nlKesKWJ1GWCd/Wbp2olNUGVM1ofLtat3n1xvwBKukc=; b=WhgPeJbcz6HxaOsZZ6Vx3I8Xo2
	UJuSH7z0wVIEzqti2gpyT17+wQDi9br6c7PLZv89DzfCEUfsMgeY2S8/v0Hr1VSh5XnUsqhbrI0VQ
	s9ZkIEhiaEKB+Up8QoMEqufyUBp3fx/eLtIsoz5OufmqL7bKjJnMrLAZpYLly/NaGM0U=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uUT1p-0006ji-GH;
	Wed, 25 Jun 2025 16:31:17 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <prvs=82719b5360=maxime.mere@foss.st.com>)
 id 1uUT1n-0006jb-FG for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 25 Jun 2025 16:31:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:CC:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ar5cY3eqwri9AVFjIOQsbTDZ2wnQ244y0/ufHL/uq/A=; b=QqfQ26xPsCfXo55RWRiakwzStG
 9Ojxe2Lny/mxBjJusQc49mnyPCc4yNAaQESmDd+/krwzzRfxySVEDaRHFXJxLLWBiuwTzSz5ZIS4x
 HtWsRyubirMgusn/7aqcmnoNrfk2uqwg7pTlMjWMOQYW8IngdrfOHFKw/S7lMju2M7oc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Ar5cY3eqwri9AVFjIOQsbTDZ2wnQ244y0/ufHL/uq/A=; b=jFvsL7is1JZQsVPJk6UsCmpDRt
 8vGvBiGfcM69dbl55j0f5yvTtL8Sa+WoYgdvS3aqw9acuVsj/EOQ44tpF1vNs+qS6Pny/pzVTEx+R
 ZZOLzXTDl7vE3khMIerk7a6nzH/vfD2rd1h+0EHcNeZ0tQHc36y/02CC9GQVaxkNccMg=;
Received: from mx08-00178001.pphosted.com ([91.207.212.93]
 helo=mx07-00178001.pphosted.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uUT1m-0001n5-Ki for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 25 Jun 2025 16:31:15 +0000
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PFvITO009480;
 Wed, 25 Jun 2025 18:30:47 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 Ar5cY3eqwri9AVFjIOQsbTDZ2wnQ244y0/ufHL/uq/A=; b=snHTUn8v8zy4BnVf
 bkKsMzALzX/hWB50aMj4MxIHi4bX+SsAYGY3Ta0qS9W+Qov86Hf3IFmC6wwbjXKe
 z+7twjq4QjRMRhSZLUxgBzx2nUR3tozW2d6dCqKxErksVbCQU6VU/JiwQwzNDwcn
 U/1p4bdqn33j4ByolMt6WwqjLdE3h61JA8R5yccQhLkGEskbTqOvCPUA7/8p3XmS
 3qkplYuF9MJHqCdFCqu0QAWkYnOvwX3wSSg4FJ6n+6+HrXVAi9jrPcnDQBoDD8cW
 6WJ6dlJDiRbtJNS8vh0xlq+UK3j8XGCWgrXg1kalJWT759R+wTleuCh44x8N8dF3
 PYWGSA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 47dkmjtf7e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 Jun 2025 18:30:47 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 5E1194002D;
 Wed, 25 Jun 2025 18:29:58 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DD36CBF53B0;
 Wed, 25 Jun 2025 18:29:23 +0200 (CEST)
Received: from [10.48.86.103] (10.48.86.103) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 25 Jun
 2025 18:29:23 +0200
Message-ID: <c1671c5e-d824-4131-861e-470d09371e05@foss.st.com>
Date: Wed, 25 Jun 2025 18:29:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Eric Biggers <ebiggers@kernel.org>
References: <20250611205859.80819-1-ebiggers@kernel.org>
 <8f4c2f36-71af-4c84-bcee-2554cea991d0@foss.st.com>
 <20250613144239.GA1287@sol>
Content-Language: en-US
From: Maxime MERE <maxime.mere@foss.st.com>
In-Reply-To: <20250613144239.GA1287@sol>
X-Originating-IP: [10.48.86.103]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_05,2025-06-25_01,2025-03-28_01
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 6/13/25 16:42, Eric Biggers wrote: > Honestly,
 the responses
 to this thread so far have made it even more clear that > this patch is the
 right decision. The chaining system I previously presented is just an example
 intended to demonstrate the value of hardware drivers in the context of ST
 platforms. 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
X-Headers-End: 1uUT1m-0001n5-Ki
Subject: Re: [f2fs-dev] [PATCH] fscrypt: don't use hardware offload Crypto
 API drivers
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-fscrypt@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-crypto@vger.kernel.org, ceph-devel@vger.kernel.org,
 linux-ext4@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

CgpPbiA2LzEzLzI1IDE2OjQyLCBFcmljIEJpZ2dlcnMgd3JvdGU6Cj4gSG9uZXN0bHksIHRoZSBy
ZXNwb25zZXMgdG8gdGhpcyB0aHJlYWQgc28gZmFyIGhhdmUgbWFkZSBpdCBldmVuIG1vcmUgY2xl
YXIgdGhhdAo+IHRoaXMgcGF0Y2ggaXMgdGhlIHJpZ2h0IGRlY2lzaW9uLgoKVGhlIGNoYWluaW5n
IHN5c3RlbSBJIHByZXZpb3VzbHkgcHJlc2VudGVkIGlzIGp1c3QgYW4gZXhhbXBsZSBpbnRlbmRl
ZCAKdG8gZGVtb25zdHJhdGUgdGhlIHZhbHVlIG9mIGhhcmR3YXJlIGRyaXZlcnMgaW4gdGhlIGNv
bnRleHQgb2YgU1QgcGxhdGZvcm1zLgoKVGhlIGtleSBwb2ludCBpcyB0aGF0IG91ciBoYXJkd2Fy
ZSBJUCBhbGxvd3MgdXMgdG8gc2VjdXJlbHkgZW1iZWQgCmVuY3J5cHRpb24ga2V5cyBkaXJlY3Rs
eSBpbiBoYXJkd2FyZSwgbWFraW5nIHN1cmUgdGhleSBhcmUgbmV2ZXIgdmlzaWJsZSAKb3IgYWNj
ZXNzaWJsZSBmcm9tIExpbnV4LCB3aGljaCBydW5zIGluIGEgbm9uLXNlY3VyZSBlbnZpcm9ubWVu
dC4gT3VyIApzb2Z0d2FyZSBhcmNoaXRlY3R1cmVzIHJlbHkgb24gYSBTZWN1cmUgT1MgcnVubmlu
ZyBpbiBwYXJhbGxlbCB3aXRoIApMaW51eCwgc2ltaWxhciB0byB3aGF0IGlzIGRvbmUgb24gQW5k
cm9pZC4gVGhpcyBTZWN1cmUgT1MgaXMgcmVzcG9uc2libGUgCmZvciBzZW5zaXRpdmUgY3J5cHRv
Z3JhcGhpYyBvcGVyYXRpb25zLgoKVGhpcyBTZWN1cmUgT1MgY2FuIG1hbmFnZXMgdGhlIGtleXMg
d2l0aCBhIGRlZGljYXRlZCBoYXJkd2FyZSBwZXJpcGhlcmFsIAooU0FFUykuIFRoZSBMaW51eCBz
aWRlIG5ldmVyIHNlZXMgdGhlIGtleXMgZGlyZWN0bHkuIEluc3RlYWQsIHRoZSBTZWN1cmUgCk9T
IHByZXBhcmVzIHRoZSBrZXlzIGFuZCBzaGFyZXMgdGhlbSBzZWN1cmVseSB3aXRoIHRoZSBjcnlw
dG9ncmFwaGljIAplbmdpbmUgKENSWVApIHRocm91Z2ggYSBkZWRpY2F0ZWQgaGFyZHdhcmUgYnVz
LgoKVGhpcyBhcmNoaXRlY3R1cmUgaW1wcm92ZXMgc2VjdXJpdHkgYm91bmRhcnk6IGtleXMgaXNv
bGF0ZWQgZnJvbSB0aGUgCm5vbi1zZWN1cmUgTGludXggZW52aXJvbm1lbnQuIEJ1dCBkZWNyeXB0
aW9uIGNhbiBiZSBwcm9jZXNzZWQgYnkgdGhlIApsaW51eCBrZXJuZWwuCgpJbiBhZGRpdGlvbiwg
U1TigJlzIGhhcmR3YXJlIGNyeXB0byBwZXJpcGhlcmFscyBjb21lIHdpdGggYnVpbHQtaW4gCnBy
b3RlY3Rpb25zIGFnYWluc3Qgc2lkZS1jaGFubmVsIGF0dGFja3MgYW5kIGhhdmUgYmVlbiBjZXJ0
aWZpZWQgd2l0aCAKU0VTSVAgYW5kIFBTQSBsZXZlbCAzIHNlY3VyaXR5IGFzc3VyYW5jZSwgcHJv
dmlkaW5nIGEgbGV2ZWwgb2Ygc2VjdXJpdHkgCmRpZmZpY3VsdCB0byBhY2hpZXZlIHdpdGggc29m
dHdhcmUgYWxvbmUuCgpSZWdhcmRpbmcgcm9idXN0bmVzcyBhbmQgbWFpbnRlbmFuY2UsIFNUIGVu
c3VyZXMgcmVndWxhciB1cGRhdGVzIG9mIGl0cyAKZHJpdmVycyBhbmQgY2FuIGZpeCBhbnkgcmVw
b3J0ZWQgYnVncy4gV2UgaGF2ZSBjb25kdWN0ZWQgaW50ZXJuYWwgdGVzdHMgCndpdGggZG0tY3J5
cHQgdGhhdCBkZW1vbnN0cmF0ZSB0aGUgcHJvcGVyIGZ1bmN0aW9uaW5nIG9mIHRoZXNlIGRyaXZl
cnMgCmZvciB0aGlzIHR5cGUgb2YgYXBwbGljYXRpb24uCgpNYXhpbWUKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxp
bmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xp
c3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
