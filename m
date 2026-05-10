Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6OuuItl1AGrpJAEAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 10 May 2026 14:11:05 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 82DBC503DB5
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 10 May 2026 14:11:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:From:References:To:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3R06Mt5LE78Cr3WN8IdjYIpxQbXiDFlaWEPHydMht+M=; b=mv+eLniE/PpH7LDWUWv3HSI13p
	+BVFf+CsCjPu01wJu+F0UfSlNznAivQSayPOtJc4P2P41pR2W/tVsNPGtxK+Q6TqbTXTTOBn3G68P
	oCoFjPsGPtv9qBuqw4HWLX0MVPjL76MlViiCBB56VcbgAuTEcKH0CM1j0lM3JD/nEJ/A=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wM2zh-0004ti-5M;
	Sun, 10 May 2026 12:10:49 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ruipengqi3@gmail.com>) id 1wM2za-0004tW-Q8
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 10 May 2026 12:10:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pADTMwgHLZcS8M9nw2OxNMnlL/QBZWV74vfUPzWUFmY=; b=RWXe9H/jsO0IS2aSHe+8hirJY5
 pF0U+p5Nc5flWzsHMGR3XpMB5lyXOaHiqrH0U5ZlLcVCkXZ53me1vEbshaCUNDYyjPA+tLpSPj1Tk
 Yy96qWBXAXgT8d7yBTsypPgpr+SpcIQl23Axn2mkNCgD3UpuNMet3ezzit4AfSqVOw5g=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=pADTMwgHLZcS8M9nw2OxNMnlL/QBZWV74vfUPzWUFmY=; b=mmR45zTuSgmh1AwY3Habn7Lxuy
 BxjRwWtiO50juvyYqtnkt2Jz8w1DxHWVKB3gl9AQfsUIr6iBDZCsTbejwicfhEGPIkxJMPgDw+fz8
 nY7NZ7mIwOcmWF3180sAttybvpOjxPCboeD/SHSg+MQPtKFQC6GWT1FSpuwWXwoPf4MY=;
Received: from mail-pf1-f182.google.com ([209.85.210.182])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1wM2za-0005L7-2U for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 10 May 2026 12:10:42 +0000
Received: by mail-pf1-f182.google.com with SMTP id
 d2e1a72fcca58-837dfccd950so1523683b3a.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 10 May 2026 05:10:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778415036; x=1779019836; darn=lists.sourceforge.net;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pADTMwgHLZcS8M9nw2OxNMnlL/QBZWV74vfUPzWUFmY=;
 b=d0my2QH54t2dXwnQDarATXciPOQHXd3VEScQEgEeJ8FHoomdF3IVia+7yLOfMAQs3x
 rQ0r1kyArEC0FU0MqknbtF/DQCaujGkDYzQYGXDB7OOU2W73KH7PS6JKNcNtlBALqA1G
 Mh/YuvripsooKr/XbD+t5EQDWBenWYav/oxBTL0dIGHLk5UWFk63oqcwme223Yoiy+8K
 2d41HhzjjkkP37Xm42Qurk1MCpoHvX1Le23TCdICegqkrvh4RzWfsJ86fd7/egm2s+nb
 fedzgYD+/aBD33vhb4nl8zqVb0oKMM9Lu1a5P+YU/ccW84OR1FCO+j8rtXQ8S/p0jKgy
 sx+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778415036; x=1779019836;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pADTMwgHLZcS8M9nw2OxNMnlL/QBZWV74vfUPzWUFmY=;
 b=CmiY18SLVjs4+Ntfqp0WgJkigjP6GXTtkf/ewxqAuQPBNbpb6frHM8N4t+4fY1crbJ
 3XzWiATp0uZKKMsTlK0Tb6SkblDCP/UoZNvx3QxlXIBqSNTndeGw6fmL2aj3m2sdzFYE
 5+Q6u2cS3i+5mR05/s10p01hgrAix0sOBs41Y8gaWNI2IQ2Je2Shx60/vy/YqyFAwm3g
 x3TERIgor7gf3eUHcn2M4DSmlU7rVIKtPwMHcHxP5/zmwhtZKKt1c+IggHO0NWLh2wLL
 gJpGa5bsyzAH2dYlgOz9km889B5T73FeOi9dsYEZALQIcWhuYpmfnuK1i5Gx+g5YaC/i
 U9xQ==
X-Gm-Message-State: AOJu0YwYP1UKguYFKCBuF1G4z3ILgaeZ2YNUPRldmVM5L7MQvlJp2Gsl
 dzwXJcWlhBhk9XCbxYBvfc+PjMiCbbRQo/jgnqoN91nbj9LHT+reNXSSKblqs1hK
X-Gm-Gg: Acq92OFSLczbrfovtMe7yZxZ8aX011dVaJFAXnOGYS9zax7ugeh04g/r2HVUPTNFmeA
 PSO6VRxr4dW2s77VU8CCK6/0TLnU5/AbDnmnmDrFm8aTXWNxMoHIk+ti87lqO9KzxUZ7Z+woETL
 PLXSqvJe1chQ67dv7G+UnHmo13OSZUyNVT4my0f+osIwQ5Yv1aVsz8Puq/h9cDgr5II5yKjUPRM
 MrIpdOg/HYCAeUMr7FmD05k1DIc7qmfXv9yZDOUB7QeBKm/JlgfTJ8jsGEXNMtMbi9LncDgleZz
 /13ttMJ58OD7MlGxzjM9ObRQbMeKQcjFQDZcBNRz/DqNz+7YYx+YoSviZ9UGXyk5nGb7x9auFya
 P+jIPRrMCJouqGqjTXEGCICB9qRgOGiYenCqgkjea44UesVkOdHyN0fEtjO300+UDXmEaiKVNmx
 fINKlJU8iUabowk61J46rBmv8kUifqTRkY96LOmeondkQWotKU
X-Received: by 2002:a05:6a00:124c:b0:834:df57:9d67 with SMTP id
 d2e1a72fcca58-83a5d285356mr20691784b3a.32.1778415036255; 
 Sun, 10 May 2026 05:10:36 -0700 (PDT)
Received: from [10.121.80.58] ([210.184.73.204])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-83967dbee14sm23091785b3a.48.2026.05.10.05.10.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 10 May 2026 05:10:35 -0700 (PDT)
Message-ID: <23d6a85e-7314-4a56-ba15-fa6727446f21@gmail.com>
Date: Sun, 10 May 2026 20:10:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Chao Yu <chao@kernel.org>, jaegeuk@kernel.org
References: <20260502124157.3406780-1-ruipengqi3@gmail.com>
 <e4b82e9f-c863-4d3a-8077-b56df9faa491@kernel.org>
Content-Language: en-US
From: Ruipeng Qi <ruipengqi3@gmail.com>
In-Reply-To: <e4b82e9f-c863-4d3a-8077-b56df9faa491@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 5/3/2026 5:47 PM, Chao Yu wrote: > On 5/2/26 20:41,
 ruipengqi
 wrote: >> From: Ruipeng Qi >> >> When the f2fs filesystem space is nearly
 exhausted, we encounter >> deadlock >> issues as below: >> [...] 
 Content analysis details:   (0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit [ruipengqi3(at)gmail.com]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [ruipengqi3(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.182 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1wM2za-0005L7-2U
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: fix potential deadlock in
 f2fs_balance_fs()
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Queue-Id: 82DBC503DB5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.91 / 15.00];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:chao@kernel.org,m:jaegeuk@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[ruipengqi3@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	TO_DN_SOME(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,gmail.com:s=20251104];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ruipengqi3@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,gmail.com:-];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Action: no action

Ck9uIDUvMy8yMDI2IDU6NDcgUE0sIENoYW8gWXUgd3JvdGU6Cj4gT24gNS8yLzI2IDIwOjQxLCBy
dWlwZW5ncWkgd3JvdGU6Cj4+IEZyb206IFJ1aXBlbmcgUWkgPHJ1aXBlbmdxaTNAZ21haWwuY29t
Pgo+Pgo+PiBXaGVuIHRoZSBmMmZzIGZpbGVzeXN0ZW0gc3BhY2UgaXMgbmVhcmx5IGV4aGF1c3Rl
ZCwgd2UgZW5jb3VudGVyIAo+PiBkZWFkbG9jawo+PiBpc3N1ZXMgYXMgYmVsb3c6Cj4+Cj4+IElO
Rk86IHRhc2sgQToxODkwIGJsb2NrZWQgZm9yIG1vcmUgdGhhbiAxMjAgc2Vjb25kcy4KPj4gwqDC
oMKgwqDCoMKgIFRhaW50ZWQ6IEfCoMKgwqDCoMKgwqDCoMKgwqDCoCBPwqDCoMKgwqDCoMKgIDYu
MTIuNDEtZzNmZTA3ZGRmMDVhYiAjMQo+PiAiZWNobyAwID4gL3Byb2Mvc3lzL2tlcm5lbC9odW5n
X3Rhc2tfdGltZW91dF9zZWNzIiBkaXNhYmxlcyB0aGlzIAo+PiBtZXNzYWdlLgo+PiB0YXNrOkHC
oMKgwqAgc3RhdGU6RCBzdGFjazowwqDCoMKgwqAgcGlkOjE4OTDCoCB0Z2lkOjE2MjbCoCBwcGlk
OjExNTMgCj4+IGZsYWdzOjB4MDAwMDAyMDQKPj4gQ2FsbCB0cmFjZToKPj4gwqAgX19zd2l0Y2hf
dG8rMHhmNC8weDE1OAo+PiDCoCBfX3NjaGVkdWxlKzB4MjdjLzB4OTA4Cj4+IMKgIHNjaGVkdWxl
KzB4M2MvMHgxMTgKPj4gwqAgaW9fc2NoZWR1bGUrMHg0NC8weDY4Cj4+IMKgIGZvbGlvX3dhaXRf
Yml0X2NvbW1vbisweDE3NC8weDM3MAo+PiDCoCBmb2xpb193YWl0X2JpdCsweDIwLzB4MzgKPj4g
wqAgZm9saW9fd2FpdF93cml0ZWJhY2srMHg1NC8weGM4Cj4+IMKgIHRydW5jYXRlX2lub2RlX3Bh
cnRpYWxfZm9saW8rMHg3MC8weDFlMAo+PiDCoCB0cnVuY2F0ZV9pbm9kZV9wYWdlc19yYW5nZSsw
eDFiMC8weDQ1MAo+PiDCoCB0cnVuY2F0ZV9wYWdlY2FjaGUrMHg1NC8weDg4Cj4+IMKgIGYyZnNf
ZmlsZV93cml0ZV9pdGVyKzB4M2U4LzB4YjgwCj4+IMKgIGRvX2l0ZXJfcmVhZHZfd3JpdGV2KzB4
ZjAvMHgxZTAKPj4gwqAgdmZzX3dyaXRldisweDEzOC8weDJjOAo+PiDCoCBkb193cml0ZXYrMHg4
OC8weDEzMAo+PiDCoCBfX2FybTY0X3N5c193cml0ZXYrMHgyOC8weDQwCj4+IMKgIGludm9rZV9z
eXNjYWxsKzB4NTAvMHgxMjAKPj4gwqAgZWwwX3N2Y19jb21tb24uY29uc3Rwcm9wLjArMHhjOC8w
eGYwCj4+IMKgIGRvX2VsMF9zdmMrMHgyNC8weDM4Cj4+IMKgIGVsMF9zdmMrMHgzMC8weGY4Cj4+
IMKgIGVsMHRfNjRfc3luY19oYW5kbGVyKzB4MTIwLzB4MTMwCj4+IMKgIGVsMHRfNjRfc3luYysw
eDE5MC8weDE5OAo+Pgo+PiBJTkZPOiB0YXNrIGt3b3JrZXIvdTg6MTE6MjY4MDg1MyBibG9ja2Vk
IGZvciBtb3JlIHRoYW4gMTIwIHNlY29uZHMuCj4+IMKgwqDCoMKgwqDCoCBUYWludGVkOiBHwqDC
oMKgwqDCoMKgwqDCoMKgwqAgT8KgwqDCoMKgwqDCoCA2LjEyLjQxLWczZmUwN2RkZjA1YWIgIzEK
Pj4gImVjaG8gMCA+IC9wcm9jL3N5cy9rZXJuZWwvaHVuZ190YXNrX3RpbWVvdXRfc2VjcyIgZGlz
YWJsZXMgdGhpcyAKPj4gbWVzc2FnZS4KPj4gdGFzazprd29ya2VyL3U4OjExwqDCoCBzdGF0ZTpE
IHN0YWNrOjDCoMKgwqDCoCBwaWQ6MjY4MDg1MyB0Z2lkOjI2ODA4NTMgCj4+IHBwaWQ6MsKgwqDC
oMKgwqAgZmxhZ3M6MHgwMDAwMDIwOAo+PiBXb3JrcXVldWU6IHdyaXRlYmFjayB3Yl93b3JrZm4g
KGZsdXNoLTI1NDowKQo+PiBDYWxsIHRyYWNlOgo+PiDCoCBfX3N3aXRjaF90bysweGY0LzB4MTU4
Cj4+IMKgIF9fc2NoZWR1bGUrMHgyN2MvMHg5MDgKPj4gwqAgc2NoZWR1bGUrMHgzYy8weDExOAo+
PiDCoCBpb19zY2hlZHVsZSsweDQ0LzB4NjgKPj4gwqAgZm9saW9fd2FpdF9iaXRfY29tbW9uKzB4
MTc0LzB4MzcwCj4+IMKgIF9fZmlsZW1hcF9nZXRfZm9saW8rMHgyMTQvMHgzNDgKPj4gwqAgcGFn
ZWNhY2hlX2dldF9wYWdlKzB4MjAvMHg3MAo+PiDCoCBmMmZzX2dldF9yZWFkX2RhdGFfcGFnZSsw
eDE1MC8weDNlOAo+PiDCoCBmMmZzX2dldF9sb2NrX2RhdGFfcGFnZSsweDJjLzB4MTYwCj4+IMKg
IG1vdmVfZGF0YV9wYWdlKzB4NTAvMHg0NzgKPj4gwqAgZG9fZ2FyYmFnZV9jb2xsZWN0KzB4ZDM4
LzB4MTUyOAo+PiDCoCBmMmZzX2djKzB4MjQwLzB4N2UwCj4+IMKgIGYyZnNfYmFsYW5jZV9mcysw
eDFhMC8weDIwOAo+PiDCoCBmMmZzX3dyaXRlX3NpbmdsZV9kYXRhX3BhZ2UrMHg2ZTQvMHg3MzAK
Pj4gwqAgZjJmc193cml0ZV9jYWNoZV9wYWdlcysweDM3OC8weDliMAo+PiDCoCBmMmZzX3dyaXRl
X2RhdGFfcGFnZXMrMHgyZTQvMHgzODgKPj4gwqAgZG9fd3JpdGVwYWdlcysweDhjLzB4MmM4Cj4+
IMKgIF9fd3JpdGViYWNrX3NpbmdsZV9pbm9kZSsweDRjLzB4NDk4Cj4+IMKgIHdyaXRlYmFja19z
Yl9pbm9kZXMrMHgyMzQvMHg0YTgKPj4gwqAgX193cml0ZWJhY2tfaW5vZGVzX3diKzB4NTgvMHgx
MTgKPj4gwqAgd2Jfd3JpdGViYWNrKzB4MmY4LzB4M2MwCj4+IMKgIHdiX3dvcmtmbisweDJjNC8w
eDUwOAo+PiDCoCBwcm9jZXNzX29uZV93b3JrKzB4MTgwLzB4NDA4Cj4+IMKgIHdvcmtlcl90aHJl
YWQrMHgyNTgvMHgzNjgKPj4gwqAga3RocmVhZCsweDExOC8weDEyOAo+PiDCoCByZXRfZnJvbV9m
b3JrKzB4MTAvMHgyMDAKPj4KPj4gSU5GTzogdGFzayBrd29ya2VyL3U4Ojg6MjY0MTI5NyBibG9j
a2VkIGZvciBtb3JlIHRoYW4gMTIwIHNlY29uZHMuCj4+IMKgwqDCoMKgwqDCoCBUYWludGVkOiBH
wqDCoMKgwqDCoMKgwqDCoMKgwqAgT8KgwqDCoMKgwqDCoCA2LjEyLjQxLWczZmUwN2RkZjA1YWIg
IzEKPj4gImVjaG8gMCA+IC9wcm9jL3N5cy9rZXJuZWwvaHVuZ190YXNrX3RpbWVvdXRfc2VjcyIg
ZGlzYWJsZXMgdGhpcyAKPj4gbWVzc2FnZS4KPj4gdGFzazprd29ya2VyL3U4OjjCoMKgwqAgc3Rh
dGU6RCBzdGFjazowwqDCoMKgwqAgcGlkOjI2NDEyOTcgdGdpZDoyNjQxMjk3IAo+PiBwcGlkOjLC
oMKgwqDCoMKgIGZsYWdzOjB4MDAwMDAyMDgKPj4gV29ya3F1ZXVlOiB3cml0ZWJhY2sgd2Jfd29y
a2ZuIChmbHVzaC0yNTQ6MCkKPj4gQ2FsbCB0cmFjZToKPj4gwqAgX19zd2l0Y2hfdG8rMHhmNC8w
eDE1OAo+PiDCoCBfX3NjaGVkdWxlKzB4MjdjLzB4OTA4Cj4+IMKgIHJ0X211dGV4X3NjaGVkdWxl
KzB4MzAvMHg2MAo+PiDCoCBfX3J0X211dGV4X3Nsb3dsb2NrX2xvY2tlZC5jb25zdHByb3AuMCsw
eDQ2MC8weDhhOAo+PiDCoCByd2Jhc2Vfd3JpdGVfbG9jaysweDI0Yy8weDM3OAo+PiDCoCBkb3du
X3dyaXRlKzB4MWMvMHgzMAo+PiDCoCBmMmZzX2JhbGFuY2VfZnMrMHgxODQvMHgyMDgKPj4gwqAg
ZjJmc193cml0ZV9pbm9kZSsweGY0LzB4MzI4Cj4+IMKgIF9fd3JpdGViYWNrX3NpbmdsZV9pbm9k
ZSsweDM3MC8weDQ5OAo+PiDCoCB3cml0ZWJhY2tfc2JfaW5vZGVzKzB4MjM0LzB4NGE4Cj4+IMKg
IF9fd3JpdGViYWNrX2lub2Rlc193YisweDU4LzB4MTE4Cj4+IMKgIHdiX3dyaXRlYmFjaysweDJm
OC8weDNjMAo+PiDCoCB3Yl93b3JrZm4rMHgyYzQvMHg1MDgKPj4gwqAgcHJvY2Vzc19vbmVfd29y
aysweDE4MC8weDQwOAo+PiDCoCB3b3JrZXJfdGhyZWFkKzB4MjU4LzB4MzY4Cj4+IMKgIGt0aHJl
YWQrMHgxMTgvMHgxMjgKPj4gwqAgcmV0X2Zyb21fZm9yaysweDEwLzB4MjAKPj4KPj4gSU5GTzog
dGFzayBCOjE5MDIgYmxvY2tlZCBmb3IgbW9yZSB0aGFuIDEyMCBzZWNvbmRzLgo+PiDCoMKgwqDC
oMKgwqAgVGFpbnRlZDogR8KgwqDCoMKgwqDCoMKgwqDCoMKgIE/CoMKgwqDCoMKgwqAgNi4xMi40
MS1nM2ZlMDdkZGYwNWFiICMxCj4+ICJlY2hvIDAgPiAvcHJvYy9zeXMva2VybmVsL2h1bmdfdGFz
a190aW1lb3V0X3NlY3MiIGRpc2FibGVzIHRoaXMgCj4+IG1lc3NhZ2UuCj4+IHRhc2s6QsKgwqDC
oMKgIHN0YXRlOkQgc3RhY2s6MMKgwqDCoMKgIHBpZDoxOTAywqAgdGdpZDoxNjI2wqAgcHBpZDox
MTUzIAo+PiBmbGFnczoweDAwMDAwMjBjCj4+IENhbGwgdHJhY2U6Cj4+IMKgIF9fc3dpdGNoX3Rv
KzB4ZjQvMHgxNTgKPj4gwqAgX19zY2hlZHVsZSsweDI3Yy8weDkwOAo+PiDCoCBydF9tdXRleF9z
Y2hlZHVsZSsweDMwLzB4NjAKPj4gwqAgX19ydF9tdXRleF9zbG93bG9ja19sb2NrZWQuY29uc3Rw
cm9wLjArMHg0NjAvMHg4YTgKPj4gwqAgcndiYXNlX3dyaXRlX2xvY2srMHgyNGMvMHgzNzgKPj4g
wqAgZG93bl93cml0ZSsweDFjLzB4MzAKPj4gwqAgZjJmc19iYWxhbmNlX2ZzKzB4MTg0LzB4MjA4
Cj4+IMKgIGYyZnNfbWFwX2Jsb2NrcysweDk0Yy8weDExMTAKPj4gwqAgZjJmc19maWxlX3dyaXRl
X2l0ZXIrMHgyMjgvMHhiODAKPj4gwqAgZG9faXRlcl9yZWFkdl93cml0ZXYrMHhmMC8weDFlMAo+
PiDCoCB2ZnNfd3JpdGV2KzB4MTM4LzB4MmM4Cj4+IMKgIGRvX3dyaXRldisweDg4LzB4MTMwCj4+
IMKgIF9fYXJtNjRfc3lzX3dyaXRldisweDI4LzB4NDAKPj4gwqAgaW52b2tlX3N5c2NhbGwrMHg1
MC8weDEyMAo+PiDCoCBlbDBfc3ZjX2NvbW1vbi5jb25zdHByb3AuMCsweGM4LzB4ZjAKPj4gwqAg
ZG9fZWwwX3N2YysweDI0LzB4MzgKPj4gwqAgZWwwX3N2YysweDMwLzB4ZjgKPj4gwqAgZWwwdF82
NF9zeW5jX2hhbmRsZXIrMHgxMjAvMHgxMzAKPj4gwqAgZWwwdF82NF9zeW5jKzB4MTkwLzB4MTk4
Cj4+Cj4+IElORk86IHRhc2sgc3luYzoyNzY5ODQ5IGJsb2NrZWQgZm9yIG1vcmUgdGhhbiAxMjAg
c2Vjb25kcy4KPj4gwqDCoMKgwqDCoMKgIFRhaW50ZWQ6IEfCoMKgwqDCoMKgwqDCoMKgwqDCoCBP
wqDCoMKgwqDCoMKgIDYuMTIuNDEtZzNmZTA3ZGRmMDVhYiAjMQo+PiAiZWNobyAwID4gL3Byb2Mv
c3lzL2tlcm5lbC9odW5nX3Rhc2tfdGltZW91dF9zZWNzIiBkaXNhYmxlcyB0aGlzIAo+PiBtZXNz
YWdlLgo+PiB0YXNrOnN5bmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0YXRlOkQgc3RhY2s6MMKg
wqDCoMKgIHBpZDoyNzY5ODQ5IHRnaWQ6Mjc2OTg0OSAKPj4gcHBpZDo3MzbCoMKgwqAgZmxhZ3M6
MHgwMDAwMDIwYwo+PiBDYWxsIHRyYWNlOgo+PiDCoCBfX3N3aXRjaF90bysweGY0LzB4MTU4Cj4+
IMKgIF9fc2NoZWR1bGUrMHgyN2MvMHg5MDgKPj4gwqAgc2NoZWR1bGUrMHgzYy8weDExOAo+PiDC
oCB3Yl93YWl0X2Zvcl9jb21wbGV0aW9uKzB4YjAvMHhlOAo+PiDCoCBzeW5jX2lub2Rlc19zYisw
eGM4LzB4MmIwCj4+IMKgIHN5bmNfaW5vZGVzX29uZV9zYisweDI0LzB4MzgKPj4gwqAgaXRlcmF0
ZV9zdXBlcnMrMHhhOC8weDEzOAo+PiDCoCBrc3lzX3N5bmMrMHg1NC8weGM4Cj4+IMKgIF9fYXJt
NjRfc3lzX3N5bmMrMHgxOC8weDMwCj4+IMKgIGludm9rZV9zeXNjYWxsKzB4NTAvMHgxMjAKPj4g
wqAgZWwwX3N2Y19jb21tb24uY29uc3Rwcm9wLjArMHhjOC8weGYwCj4+IMKgIGRvX2VsMF9zdmMr
MHgyNC8weDM4Cj4+IMKgIGVsMF9zdmMrMHgzMC8weGY4Cj4+IMKgIGVsMHRfNjRfc3luY19oYW5k
bGVyKzB4MTIwLzB4MTMwCj4+IMKgIGVsMHRfNjRfc3luYysweDE5MC8weDE5OAo+Pgo+PiBUaGUg
cm9vdCBjYXVzZSBpcyBhIHBvdGVudGlhbCBkZWFkbG9jayBiZXR3ZWVuIHRoZSBmb2xsb3dpbmcg
dGFza3M6Cj4+Cj4+IGt3b3JrZXIvdTg6MTHCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
VGhyZWFkIEEKPj4gLSBmMmZzX3dyaXRlX3NpbmdsZV9kYXRhX3BhZ2UKPj4gwqAgLSBmMmZzX2Rv
X3dyaXRlX2RhdGFfcGFnZQo+PiDCoMKgIC0gZm9saW9fc3RhcnRfd3JpdGViYWNrKFgpCj4+IMKg
wqAgLSBmMmZzX291dHBsYWNlX3dyaXRlX2RhdGEKPj4gwqDCoMKgIC0gYmlvX2FkZF9mb2xpbyhY
KQo+PiDCoCAtIGZvbGlvX3VubG9jayhYKQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCAtIHRydW5jYXRlX2lub2RlX3BhZ2VzX3JhbmdlCj4+IMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLSBfX2ZpbGVtYXBfZ2V0X2ZvbGlvKFgsIEZHUF9M
T0NLKQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC0gdHJ1bmNh
dGVfaW5vZGVfcGFydGlhbF9mb2xpbyhYKQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgLSBmb2xpb193YWl0X3dyaXRlYmFjayhYKQo+PiDCoCAtIGYyZnNfYmFs
YW5jZV9mcwo+PiDCoMKgIC0gZjJmc19nYwo+PiDCoMKgwqAgLSBkb19nYXJiYWdlX2NvbGxlY3QK
Pj4gwqDCoMKgwqAgLSBtb3ZlX2RhdGFfcGFnZQo+PiDCoMKgwqDCoMKgIC0gZjJmc19nZXRfbG9j
a19kYXRhX3BhZ2UKPj4gwqDCoMKgwqDCoMKgIC0gX19maWxlbWFwX2dldF9mb2xpbyhYLCBGR1Bf
TE9DSykKPj4KPj4gQm90aCB0aHJlYWRzIHRyeSB0byBhY2Nlc3MgZm9saW8gWC4gVGhyZWFkIEEg
aG9sZHMgdGhlIGxvY2sgYnV0IHdhaXRzCj4+IGZvciB3cml0ZWJhY2ssIHdoaWxlIGt3b3JrZXIg
d2FpdHMgZm9yIHRoZSBsb2NrLiBUaGlzIGNhdXNlcyBhIGRlYWRsb2NrLgo+Pgo+PiBPdGhlciB0
aHJlYWRzIGFsc28gZW50ZXIgRCBzdGF0ZSwgd2FpdGluZyBmb3IgbG9ja3Mgc3VjaCBhcyBnY19s
b2NrIGFuZAo+PiB3cml0ZXBhZ2VzLgo+Pgo+PiBPUFUvSVBVIERBVEEgZm9saW8gYXJlIGFsbCBh
ZmZlY3RlZCBieSB0aGlzIGlzc3VlLiBUbyBhdm9pZCBzdWNoCj4+IHBvdGVudGlhbCBkZWFkbG9j
a3MsIGFsd2F5cyBjb21taXQgdGhlc2UgY2FjaGVkIGZvbGlvcyBiZWZvcmUKPj4gdHJpZ2dlcmlu
ZyBmMmZzX2djKCkgaW4gZjJmc19iYWxhbmNlX2ZzKCkuCj4+Cj4+IHYyOgo+PiAtIENvbW1pdCBj
YWNoZWQgT1BVL0lQVSBmb2xpb3MsIG5vdCBqdXN0IE9QVSBmb2xpb3MgYXMgaW4gdjEuCj4+Cj4+
IHYzOgo+PiAtIEZpeGVkIG1pbm9yIGdyYW1tYXRpY2FsIGlzc3Vlcwo+PiAtIEFkZCBjb21tZW50
IG9uIGxvY2tsZXNzIGxpc3RfZW1wdHkoKSB0byBleHBsYWluIHdoeSBpdCBpcyBzYWZlCj4+IMKg
wqAgd2l0aG91dCBob2xkaW5nIGJpb19saXN0X2xvY2sKPj4KPj4gU3VnZ2VzdGVkLWJ5OiBDaGFv
IDxjaGFvQGtlcm5lbC5vcmc+Cj4KPiBDaGFvIFl1IDxjaGFvQGtlcm5lbC5vcmc+LCA6KQo+Cj4+
IFNpZ25lZC1vZmYtYnk6IFJ1aXBlbmcgUWkgPHJ1aXBlbmdxaTNAZ21haWwuY29tPgo+Cj4gUmV2
aWV3ZWQtYnk6IENoYW8gWXUgPGNoYW9Aa2VybmVsLm9yZz4KPgo+IFRoYW5rcywKCkhpIEphZWdl
dWssIENoYW8sCgpHZW50bGUgcGluZy4KClRoaXMgcGF0Y2ggaGFzIGJlZW4gZGlzY3Vzc2VkIGZv
ciBhYm91dCBhIG1vbnRoIGFuZAphbHJlYWR5IGdvdCBSZXZpZXdlZC1ieSBmcm9tIENoYW8uCgpD
b3VsZCB5b3UgcGxlYXNlIHBpY2sgdXAgdGhpcyBwYXRjaCB3aGVuIHlvdSBoYXZlIHRpbWU/CgpU
aGFua3MsClJ1aXBlbmcKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBs
aXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMv
bGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
