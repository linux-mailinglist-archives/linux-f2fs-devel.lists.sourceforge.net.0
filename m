Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A893C1BDC8D
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 29 Apr 2020 14:44:39 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jTm4m-00007d-85; Wed, 29 Apr 2020 12:44:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dan.carpenter@oracle.com>) id 1jTm4k-00007P-RT
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 29 Apr 2020 12:44:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wDExqGqXpcZDnGmuWjfBfH28yeSa4fR8ye9MRxfFVbk=; b=VY/CzCHSTKuWC8q0olRyJBrCdV
 InzBdNvI5zBvmr4UwCjDc1IT/o4c5//MEnLyL/TVhZpM3FSQ7A6GCimR6INaeSn0Fp1J6POqV+OpA
 kSVF87+5fh4HFoJmuh4tR/IEQzBNnkko+5ZyMHCzT8U5z8n9NX9/NmnqAaGsm1oiHEW8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wDExqGqXpcZDnGmuWjfBfH28yeSa4fR8ye9MRxfFVbk=; b=aFZ/Hu3dQI+iZb4wIgCtLr/lKl
 P8hPo5nAf4HMG/jXOMJ23f3I1EZ2GYNEZmxKKULc1ede92Z+qksijfAsWsYVXORAXIrt4M6kChAzM
 +VYh8I9QAgrRAjuIiMNNWVfdvlK+ryfHNqCTwuYZ40uQtKubWHIklk6jpoUU3jmONMAk=;
Received: from aserp2120.oracle.com ([141.146.126.78])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jTm4h-002Fak-3Y
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 29 Apr 2020 12:44:30 +0000
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 03TCgm8U185089;
 Wed, 29 Apr 2020 12:44:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 content-transfer-encoding : in-reply-to; s=corp-2020-01-29;
 bh=wDExqGqXpcZDnGmuWjfBfH28yeSa4fR8ye9MRxfFVbk=;
 b=Ace3/2kGXgWBhupNWf6WZIs8/V9hqtLZQ6yvt9fIqP1JUgPPGshSRaTqDmf+YXxFe+gq
 Jk4p5wXeYG1RbqG6DpkFGUHRgBlyATMPoir9TUyhtDoxz1yCp5c2Q9EsdTtju7cKyQHf
 yxiazpkKjMto6N3teQsJsRGIpjH2GFJDUmioGee8ss6VjBDlMwwIXvc2winZmKVTTT40
 qeC087nGfJMEBhZoZT5pO+uPXmvFq0d8HHZcRhe7aVISu5Jrjf1cqratX5jVIWcvAJPD
 TKj+y2S2m1p17qWKYYDK53HeQgQi9jyGTPJ/sNxynfOf5AbUYABgL0FhEcE9kj7EQIyZ Kw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2120.oracle.com with ESMTP id 30nucg5fux-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 29 Apr 2020 12:44:11 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 03TCg5G0028007;
 Wed, 29 Apr 2020 12:44:11 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3030.oracle.com with ESMTP id 30mxrv10ef-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 29 Apr 2020 12:44:11 +0000
Received: from abhmp0016.oracle.com (abhmp0016.oracle.com [141.146.116.22])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 03TCi9n4014810;
 Wed, 29 Apr 2020 12:44:09 GMT
Received: from kadam (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 29 Apr 2020 05:44:08 -0700
Date: Wed, 29 Apr 2020 15:44:02 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Sayali Lokhande <sayalil@codeaurora.org>
Message-ID: <20200429124402.GP2014@kadam>
References: <07a820a2-b3b3-32ca-75ce-ceaca106d2c6@web.de>
 <433d4ad5-22e5-fd2b-cab3-9752ed0c66fb@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <433d4ad5-22e5-fd2b-cab3-9752ed0c66fb@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9605
 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 phishscore=0 suspectscore=0
 mlxlogscore=979 malwarescore=0 bulkscore=0 spamscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2004290107
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9605
 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1011
 priorityscore=1501
 mlxlogscore=999 impostorscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 mlxscore=0 spamscore=0 adultscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004290107
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.9 RCVD_IN_MSPIKE_L3      RBL: Low reputation (-3)
 [141.146.126.78 listed in bl.mailspike.net]
 0.0 UNPARSEABLE_RELAY Informational: message has unparseable relay lines
 0.0 RCVD_IN_MSPIKE_BL      Mailspike blacklisted
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.8 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jTm4h-002Fak-3Y
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gV2VkLCBBcHIgMjksIDIwMjAgYXQgMTA6Mjg6MzZBTSArMDUzMCwgU2F5YWxpIExva2hhbmRl
IHdyb3RlOgo+IEhpIE1hcmt1cwo+IAo+IE9uIDQvMjcvMjAyMCA0OjA4IFBNLCBNYXJrdXMgRWxm
cmluZyB3cm90ZToKPiA+ID4g4oCmIFRoaXMgcmVzdWx0cyBpbiBkZWFkbG9jayBhcwo+ID4gPiBp
cHV0KCkgdHJpZXMgdG8gaG9sZCBjcF9yd3NlbSwgd2hpY2ggaXMgYWxyZWFkeSBoZWxkIGF0IHRo
ZQo+ID4gPiBiZWdpbm5pbmcgYnkgY2hlY2twb2ludC0+YmxvY2tfb3BlcmF0aW9ucygpLgo+ID4g
V2lsbCBhbm90aGVyIGltcGVyYXRpdmUgd29yZGluZyBiZWNvbWUgaGVscGZ1bCBiZXNpZGVzIHRo
ZSBwcm92aWRlZCBpbmZvcm1hdGlvbgo+ID4gZm9yIHRoaXMgY2hhbmdlIGRlc2NyaXB0aW9uPwo+
ID4gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvdG9ydmFs
ZHMvbGludXguZ2l0L3RyZWUvRG9jdW1lbnRhdGlvbi9wcm9jZXNzL3N1Ym1pdHRpbmctcGF0Y2hl
cy5yc3Q/aWQ9NmE4YjU1ZWQ0MDU2ZWE1NTU5ZWJlNGY2YTRiMjQ3ZjYyNzg3MGQ0YyNuMTUxCj4g
PiAKPiA+IFdvdWxkIHlvdSBsaWtlIHRvIGFkZCB0aGUgdGFnIOKAnEZpeGVz4oCdIGJlY2F1c2Ug
b2YgYWRqdXN0bWVudHMKPiA+IGZvciB0aGUgZGF0YSBzeW5jaHJvbmlzYXRpb24/Cj4gCj4gSSBj
b3VsZG4ndCBmaW5kIGFueSBwYXN0IGNvbW1pdCB3aGljaCBzdWl0cyB0byBiZSBhZGRlZCB1bmRl
ciAiRml4ZXMiIGhlcmUuCj4gTGV0IG1lIGtub3cgaWYgeW91IGhhdmUgYW55IG90aGVyIGNvbW1l
bnQuCgpUaGlzIGxvb2tzIHJlYWxseSBvbGQuICBNYXliZSBjb21taXQgMzk5MzY4MzcyZWQ5ICgi
ZjJmczogaW50cm9kdWNlIGEKbmV3IGdsb2JhbCBsb2NrIHNjaGVtZSIpPwoKcmVnYXJkcywKZGFu
IGNhcnBlbnRlcgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3Rz
LnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0
aW5mby9saW51eC1mMmZzLWRldmVsCg==
