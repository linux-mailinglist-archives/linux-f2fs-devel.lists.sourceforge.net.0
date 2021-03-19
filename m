Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F7D73428E1
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 19 Mar 2021 23:47:26 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lNNto-0000iA-DY; Fri, 19 Mar 2021 22:47:20 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <me@beroal.in.ua>) id 1lNNtm-0000i1-6h
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 19 Mar 2021 22:47:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Date:Message-ID:Subject:From:To:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=L50+z3hMa1V1mXVXgiWEA2RH5z2a30THfvX7GzfJedg=; b=dyepbO9g36Luzjown4kodi236R
 8xSFzJfZ8IsLgUHQf5kbxfxYjF+yri9A3oW0iYFU5ycTCBkgqZH2tzxmA5wt/yWAi9drSaRIeIILC
 895c9y+nf0VU6AjsTMP3AFIdBWstkO4Zrd7fl2fbYAwbN7lAs5fgjqqsqm5L1cSroUg4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Date:Message-ID:
 Subject:From:To:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=L50+z3hMa1V1mXVXgiWEA2RH5z2a30THfvX7GzfJedg=; b=j
 6qkI3thkzCo//tewTueL37L+QnIN6Om6kMsbbuxGXVJ0RWPQv286yWn1SBrO+oaCFUMduN86RPnaX
 krN30QJ3O4cyMjl/2wyELjUANqSRQ28RhB+an9AGf7Xtf7NYthwAe6KYcKUdO8SIXpi3j8MEu1ogY
 qjY4+44ekNv9QKVQ=;
Received: from smtp-1.1gb.com.ua ([195.234.4.10] helo=u1.1gb.ua)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtp (Exim 4.92.2)
 id 1lNNtg-003Qw0-OZ
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 19 Mar 2021 22:47:18 +0000
Received: from Spooler by u1.1gb.ua (Mercury/32 v4.52) ID MO009728;
 20 Mar 2021 00:47:14 +0200
Received: from spooler by mail-u1-robots.in-solve.hidden (Mercury/32 v4.52);
 20 Mar 2021 00:47:02 +0200
Received: from ul1.1gb.ua (195.234.4.24) by smtp-1.1gb.com.ua (Mercury/32
 v4.52) with ESMTP ID MG009727; 20 Mar 2021 00:46:57 +0200
Received: from [192.162.141.53] ([192.162.141.53]) (authenticated bits=0)
 by ul1.1gb.ua (8.14.9/8.14.9) with ESMTP id 12JMkshr005498
 (version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NO)
 for <linux-f2fs-devel@lists.sourceforge.net>; Sat, 20 Mar 2021 00:46:54 +0200
To: linux-f2fs-devel@lists.sourceforge.net
From: beroal <me@beroal.in.ua>
Message-ID: <739ae455-07b4-7dc4-1789-5b162ed25ede@beroal.in.ua>
Date: Sat, 20 Mar 2021 00:46:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
Content-Language: en-US
X-Spam-Score: 0.4 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.4 KHOP_HELO_FCRDNS       Relay HELO differs from its IP's reverse DNS
X-Headers-End: 1lNNtg-003Qw0-OZ
Subject: [f2fs-dev] `mount` reports an error, but `fsck.f2fs` does not
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

SGkuIEFmdGVyIEkgZXh0ZW5kZWQgYSBwYXJ0aXRpb24gY29udGFpbmluZyBGMkZTIHdpdGggYSBy
ZWNlbnQgdmVyc2lvbiAKb2YgR3BhcnRlZCwgdGhlIHBhcnRpdGlvbiBubyBsb25nZXIgbW91bnRz
LiBgbW91bnRgIHJlcG9ydHMgYW4gZXJyb3IsIApidXQgYGZzY2suZjJmc2AgZG9lcyBub3Qgc2Vl
IGFueSBwcm9ibGVtICh3ZWxsLCBleGNlcHQgZm9yIGBJbnZhbGlkIENQIApDUkMgb2Zmc2V0OiAw
YCkgYW5kIGRvZXMgbm90IGZpeCB0aGUgZmlsZSBzeXN0ZW0uCgpgYGAKbG9zZXR1cCAvZGV2L2xv
b3AwIGFyY2gtb3MuaW1nCm1vdW50IC10IGYyZnMgLW8gcm8gL2Rldi9sb29wMCAvcm9vdC9tbnQv
dGVtcApgYGAKCmBgYApbIDY4OTAuNjQ3NzQ5XSBGMkZTLWZzIChsb29wMCk6IFdyb25nIHZhbGlk
X3VzZXJfYmxvY2tzOiAxNjA0MDA0OCwgCnVzZXJfYmxvY2tfY291bnQ6IDEwMDE2NzY4ClsgNjg5
MC42NDc4MDhdIEYyRlMtZnMgKGxvb3AwKTogRmFpbGVkIHRvIGdldCB2YWxpZCBGMkZTIGNoZWNr
cG9pbnQKYGBgCgpgYGAKbG9zZXR1cCAtZCAvZGV2L2xvb3AwCmZzY2suZjJmcyBhcmNoLW9zLmlt
ZwpgYGAKCmBgYApJbmZvOiBTZWdtZW50cyBwZXIgc2VjdGlvbiA9IDEKSW5mbzogU2VjdGlvbnMg
cGVyIHpvbmUgPSAxCkluZm86IHNlY3RvciBzaXplID0gNTEyCkluZm86IHRvdGFsIHNlY3RvcnMg
PSAxNjI5MTYzNTIgKDc5NTQ5IE1CKQpJbmZvOiBNS0ZTIHZlcnNpb24KIMKgICJMaW51eCB2ZXJz
aW9uIDQuNC4xLTItQVJDSCAoYnVpbGR1c2VyQGZvdXRyZWxpcykgKGdjYyB2ZXJzaW9uIDUuMy4w
IAooR0NDKSApICMxIFNNUCBQUkVFTVBUIFdlZCBGZWIgMyAxMzoxMjozMyBVVEMgMjAxNiIKSW5m
bzogRlNDSyB2ZXJzaW9uCiDCoCBmcm9tICJMaW51eCB2ZXJzaW9uIDUuNy4xMi1hcmNoMS0xIChs
aW51eEBhcmNobGludXgpIChnY2MgdmVyc2lvbiAKMTAuMS4wIChHQ0MpLCBHTlUgbGQgKEdOVSBC
aW51dGlscykgMi4zNC4wKSAjMSBTTVAgUFJFRU1QVCBGcmksIDMxIEp1bCAKMjAyMCAxNzozODoy
MiArMDAwMCIKIMKgwqDCoCB0byAiTGludXggdmVyc2lvbiA1LjExLjctYXJjaDEtMSAobGludXhA
YXJjaGxpbnV4KSAoZ2NjIChHQ0MpIAoxMC4yLjAsIEdOVSBsZCAoR05VIEJpbnV0aWxzKSAyLjM2
LjEpICMxIFNNUCBQUkVFTVBUIFdlZCwgMTcgTWFyIDIwMjEgCjE2OjU5OjU4ICswMDAwIgpJbmZv
OiBzdXBlcmJsb2NrIGZlYXR1cmVzID0gMCA6CkluZm86IHN1cGVyYmxvY2sgZW5jcnlwdCBsZXZl
bCA9IDAsIHNhbHQgPSAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMApJbmZvOiB0b3Rh
bCBGUyBzZWN0b3JzID0gMTYyOTE2MzUyICg3OTU0OSBNQikKIMKgwqDCoCBJbnZhbGlkIENQIENS
QyBvZmZzZXQ6IDAKSW5mbzogQ0tQVCB2ZXJzaW9uID0gYTE0ZDRjCkluZm86IENoZWNrZWQgdmFs
aWQgbmF0X2JpdHMgaW4gY2hlY2twb2ludApJbmZvOiBjaGVja3BvaW50IHN0YXRlID0gODEgOsKg
IG5hdF9iaXRzIHVubW91bnQKCltGU0NLXSBVbnJlYWNoYWJsZSBuYXQgZW50cmllc8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgW09rLi5dIFsweDBdCltGU0NL
XSBTSVQgdmFsaWQgYmxvY2sgYml0bWFwIGNoZWNraW5nwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIFtPay4uXQpbRlNDS10gSGFyZCBsaW5rIGNoZWNraW5nIGZvciByZWd1bGFyIGZpbGXC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIFtPay4uXSBbMHg3MTldCltGU0NLXSB2YWxpZF9ibG9ja19j
b3VudCBtYXRjaGluZyB3aXRoIENQwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFtPay4uXSBbMHhm
NGMwNzBdCltGU0NLXSB2YWxpZF9ub2RlX2NvdW50IG1hdGNoaW5nIHdpdGggQ1AgKGRlIGxvb2t1
cCnCoCBbT2suLl0gWzB4ZTI0MmFdCltGU0NLXSB2YWxpZF9ub2RlX2NvdW50IG1hdGNoaW5nIHdp
dGggQ1AgKG5hdCBsb29rdXApIFtPay4uXSBbMHhlMjQyYV0KW0ZTQ0tdIHZhbGlkX2lub2RlX2Nv
dW50IG1hdGNoZWQgd2l0aCBDUMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFtPay4uXSBbMHhl
MDQ3MF0KW0ZTQ0tdIGZyZWUgc2VnbWVudF9jb3VudCBtYXRjaGVkIHdpdGggQ1DCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgW09rLi5dIFsweDFkNmJdCltGU0NLXSBuZXh0IGJsb2NrIG9mZnNldCBp
cyBmcmVlwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFtPay4uXQpb
RlNDS10gZml4aW5nIFNJVCB0eXBlcwpbRlNDS10gb3RoZXIgY29ycnVwdGVkIGJ1Z3PCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFtPay4uXQoKRG9u
ZTogMTQuMTAwMDAwIHNlY3MKYGBgCgpDYW4gSSBmaXggdGhpcyBmaWxlIHN5c3RlbSBhbmQgaG93
PwoKZjJmcy10b29scyAxLjE0LjAKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1k
ZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQv
bGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
