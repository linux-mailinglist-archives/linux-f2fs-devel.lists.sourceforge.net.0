Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4982934B757
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 27 Mar 2021 14:28:11 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lQ8z3-0005NZ-R7; Sat, 27 Mar 2021 13:28:09 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <me@beroal.in.ua>) id 1lQ8z2-0005NI-Jf
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 27 Mar 2021 13:28:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZQzrbz5QDHDsKrVcJy0iw1pqG054gj/Cv/qCpLmPBUs=; b=IFOCPzC5Z5hXcPcc+VToqUROIf
 gc8kZNrNmhaW4VjIaeGaO5nmfWyHhBSMqfHk4PYRT3vM1qKoK6q2Ze966c1SUVI5jQgVYM++elDgg
 AIVq7KaO9JQQ6b8iFt5SSfHUFLSHqaWLb4JLCsQuO/fO0rwmsDD2NGznC9MJ64k8XnBA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ZQzrbz5QDHDsKrVcJy0iw1pqG054gj/Cv/qCpLmPBUs=; b=F6y304mXkEanwFod1Zt95MgWDm
 xC1UVDh/chkBgay8dT8k7gsiDCmS1wRZyBcRzJSwvhuhliK3u6OVf/TVoIJxncUmdhk5Ie7efs24q
 xjC/xO/ZnO5S7mt3lAuWx5EDAxdAuUb5qDTQBYx0iAqrbk+91kNbcNbdryA6iPBM4OQM=;
Received: from smtp-1.1gb.com.ua ([195.234.4.10] helo=u1.1gb.ua)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtp (Exim 4.92.2)
 id 1lQ8yh-000VUS-KF
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 27 Mar 2021 13:28:07 +0000
Received: from Spooler by u1.1gb.ua (Mercury/32 v4.52) ID MO0042CF;
 27 Mar 2021 15:27:46 +0200
Received: from spooler by mail-u1-robots.in-solve.hidden (Mercury/32 v4.52);
 27 Mar 2021 15:27:40 +0200
Received: from ul1.1gb.ua (195.234.4.24) by smtp-1.1gb.com.ua (Mercury/32
 v4.52) with ESMTP ID MG0042CD; 27 Mar 2021 15:27:34 +0200
Received: from [192.162.141.53] ([192.162.141.53]) (authenticated bits=0)
 by ul1.1gb.ua (8.14.9/8.14.9) with ESMTP id 12RDRXLe005290
 (version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NO)
 for <linux-f2fs-devel@lists.sourceforge.net>; Sat, 27 Mar 2021 15:27:33 +0200
To: linux-f2fs-devel@lists.sourceforge.net
References: <739ae455-07b4-7dc4-1789-5b162ed25ede@beroal.in.ua>
From: beroal <me@beroal.in.ua>
Message-ID: <bc3759b9-c606-5e77-40f0-c590bbc53bfb@beroal.in.ua>
Date: Sat, 27 Mar 2021 15:27:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <739ae455-07b4-7dc4-1789-5b162ed25ede@beroal.in.ua>
Content-Language: en-US
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 TIME_LIMIT_EXCEEDED    Exceeded time limit / deadline
X-Headers-End: 1lQ8yh-000VUS-KF
Subject: Re: [f2fs-dev] `mount` reports an error, but `fsck.f2fs` does not
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

UGluZy4KCk9uIDIwLjAzLjIxIDAwOjQ2LCBiZXJvYWwgd3JvdGU6Cj4gSGkuIEFmdGVyIEkgZXh0
ZW5kZWQgYSBwYXJ0aXRpb24gY29udGFpbmluZyBGMkZTIHdpdGggYSByZWNlbnQgdmVyc2lvbiAK
PiBvZiBHcGFydGVkLCB0aGUgcGFydGl0aW9uIG5vIGxvbmdlciBtb3VudHMuIGBtb3VudGAgcmVw
b3J0cyBhbiBlcnJvciwgCj4gYnV0IGBmc2NrLmYyZnNgIGRvZXMgbm90IHNlZSBhbnkgcHJvYmxl
bSAod2VsbCwgZXhjZXB0IGZvciBgSW52YWxpZCBDUCAKPiBDUkMgb2Zmc2V0OiAwYCkgYW5kIGRv
ZXMgbm90IGZpeCB0aGUgZmlsZSBzeXN0ZW0uCj4KPiBgYGAKPiBsb3NldHVwIC9kZXYvbG9vcDAg
YXJjaC1vcy5pbWcKPiBtb3VudCAtdCBmMmZzIC1vIHJvIC9kZXYvbG9vcDAgL3Jvb3QvbW50L3Rl
bXAKPiBgYGAKPgo+IGBgYAo+IFsgNjg5MC42NDc3NDldIEYyRlMtZnMgKGxvb3AwKTogV3Jvbmcg
dmFsaWRfdXNlcl9ibG9ja3M6IDE2MDQwMDQ4LCAKPiB1c2VyX2Jsb2NrX2NvdW50OiAxMDAxNjc2
OAo+IFsgNjg5MC42NDc4MDhdIEYyRlMtZnMgKGxvb3AwKTogRmFpbGVkIHRvIGdldCB2YWxpZCBG
MkZTIGNoZWNrcG9pbnQKPiBgYGAKPgo+IGBgYAo+IGxvc2V0dXAgLWQgL2Rldi9sb29wMAo+IGZz
Y2suZjJmcyBhcmNoLW9zLmltZwo+IGBgYAo+Cj4gYGBgCj4gSW5mbzogU2VnbWVudHMgcGVyIHNl
Y3Rpb24gPSAxCj4gSW5mbzogU2VjdGlvbnMgcGVyIHpvbmUgPSAxCj4gSW5mbzogc2VjdG9yIHNp
emUgPSA1MTIKPiBJbmZvOiB0b3RhbCBzZWN0b3JzID0gMTYyOTE2MzUyICg3OTU0OSBNQikKPiBJ
bmZvOiBNS0ZTIHZlcnNpb24KPiDCoCAiTGludXggdmVyc2lvbiA0LjQuMS0yLUFSQ0ggKGJ1aWxk
dXNlckBmb3V0cmVsaXMpIChnY2MgdmVyc2lvbiA1LjMuMCAKPiAoR0NDKSApICMxIFNNUCBQUkVF
TVBUIFdlZCBGZWIgMyAxMzoxMjozMyBVVEMgMjAxNiIKPiBJbmZvOiBGU0NLIHZlcnNpb24KPiDC
oCBmcm9tICJMaW51eCB2ZXJzaW9uIDUuNy4xMi1hcmNoMS0xIChsaW51eEBhcmNobGludXgpIChn
Y2MgdmVyc2lvbiAKPiAxMC4xLjAgKEdDQyksIEdOVSBsZCAoR05VIEJpbnV0aWxzKSAyLjM0LjAp
ICMxIFNNUCBQUkVFTVBUIEZyaSwgMzEgSnVsIAo+IDIwMjAgMTc6Mzg6MjIgKzAwMDAiCj4gwqDC
oMKgIHRvICJMaW51eCB2ZXJzaW9uIDUuMTEuNy1hcmNoMS0xIChsaW51eEBhcmNobGludXgpIChn
Y2MgKEdDQykgCj4gMTAuMi4wLCBHTlUgbGQgKEdOVSBCaW51dGlscykgMi4zNi4xKSAjMSBTTVAg
UFJFRU1QVCBXZWQsIDE3IE1hciAyMDIxIAo+IDE2OjU5OjU4ICswMDAwIgo+IEluZm86IHN1cGVy
YmxvY2sgZmVhdHVyZXMgPSAwIDoKPiBJbmZvOiBzdXBlcmJsb2NrIGVuY3J5cHQgbGV2ZWwgPSAw
LCBzYWx0ID0gCj4gMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAKPiBJbmZvOiB0b3Rh
bCBGUyBzZWN0b3JzID0gMTYyOTE2MzUyICg3OTU0OSBNQikKPiDCoMKgwqAgSW52YWxpZCBDUCBD
UkMgb2Zmc2V0OiAwCj4gSW5mbzogQ0tQVCB2ZXJzaW9uID0gYTE0ZDRjCj4gSW5mbzogQ2hlY2tl
ZCB2YWxpZCBuYXRfYml0cyBpbiBjaGVja3BvaW50Cj4gSW5mbzogY2hlY2twb2ludCBzdGF0ZSA9
IDgxIDrCoCBuYXRfYml0cyB1bm1vdW50Cj4KPiBbRlNDS10gVW5yZWFjaGFibGUgbmF0IGVudHJp
ZXPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFtPay4uXSBb
MHgwXQo+IFtGU0NLXSBTSVQgdmFsaWQgYmxvY2sgYml0bWFwIGNoZWNraW5nwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIFtPay4uXQo+IFtGU0NLXSBIYXJkIGxpbmsgY2hlY2tpbmcgZm9y
IHJlZ3VsYXIgZmlsZcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgW09rLi5dIFsweDcxOV0KPiBbRlND
S10gdmFsaWRfYmxvY2tfY291bnQgbWF0Y2hpbmcgd2l0aCBDUMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBbT2suLl0gWzB4ZjRjMDcwXQo+IFtGU0NLXSB2YWxpZF9ub2RlX2NvdW50IG1hdGNoaW5n
IHdpdGggQ1AgKGRlIGxvb2t1cCnCoCBbT2suLl0gWzB4ZTI0MmFdCj4gW0ZTQ0tdIHZhbGlkX25v
ZGVfY291bnQgbWF0Y2hpbmcgd2l0aCBDUCAobmF0IGxvb2t1cCkgW09rLi5dIFsweGUyNDJhXQo+
IFtGU0NLXSB2YWxpZF9pbm9kZV9jb3VudCBtYXRjaGVkIHdpdGggQ1DCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBbT2suLl0gWzB4ZTA0NzBdCj4gW0ZTQ0tdIGZyZWUgc2VnbWVudF9jb3VudCBt
YXRjaGVkIHdpdGggQ1DCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgW09rLi5dIFsweDFkNmJdCj4g
W0ZTQ0tdIG5leHQgYmxvY2sgb2Zmc2V0IGlzIGZyZWXCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgW09rLi5dCj4gW0ZTQ0tdIGZpeGluZyBTSVQgdHlwZXMKPiBbRlND
S10gb3RoZXIgY29ycnVwdGVkIGJ1Z3PCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIFtPay4uXQo+Cj4gRG9uZTogMTQuMTAwMDAwIHNlY3MKPiBgYGAK
Pgo+IENhbiBJIGZpeCB0aGlzIGZpbGUgc3lzdGVtIGFuZCBob3c/Cj4KPiBmMmZzLXRvb2xzIDEu
MTQuMAo+Cj4KPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCj4gTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKPiBMaW51eC1mMmZzLWRldmVsQGxp
c3RzLnNvdXJjZWZvcmdlLm5ldAo+IGh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3Rz
L2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1m
MmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdl
Lm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
