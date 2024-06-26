Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 097129175E8
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 26 Jun 2024 03:54:17 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sMHrP-0007mX-KT;
	Wed, 26 Jun 2024 01:54:12 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <niuzhiguo84@gmail.com>) id 1sMHrM-0007mM-Se
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 26 Jun 2024 01:54:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Yt1OSJl92903gzgy+xbO+teewEi8pHwOPc/OOCe+r8U=; b=Iy3FAQ7BFo63xlAgtLlEWkl6MG
 8wyf1dFwNk/Hc73TJ40UTz+eO8aZGh2DXFASyLjGdlAmqCjAob1ShpoOLjonXDZ+XUngl6mIDmixC
 FXQknVx8SNlRoU7fQfl+s1lPXtaw+wr2VPN8W9HsNGr5BNkd6XUflaoP2s3sfdpnOefk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Yt1OSJl92903gzgy+xbO+teewEi8pHwOPc/OOCe+r8U=; b=FOyX2nMVRt1b1t0YpKX9qlIwaZ
 f3WXyUc3kCJRDfCjBlcBWi1pI+S1nvILeKjAczJ50LNfacDf3YUQxI0Xex82dzB5i39I1U5TsduI3
 iRxO00GaccjVb45wFNznOCAME+MkDa6xcQ+ecWQ4BQ1LPUwa1Adbr0CY6IDWy+hkDzqE=;
Received: from mail-lf1-f46.google.com ([209.85.167.46])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1sMHrM-00039h-U7 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 26 Jun 2024 01:54:09 +0000
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-52cd717ec07so5352522e87.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 25 Jun 2024 18:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719366836; x=1719971636; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Yt1OSJl92903gzgy+xbO+teewEi8pHwOPc/OOCe+r8U=;
 b=E4Synpx/ubmOBWbfmcWOoT23ry2g0zlQ6Gn9TxRAmyV2uUsnO32gkPC+KUNPHZ33oF
 E/ggJusY5mAErW3INTtiA234/SgO0rgoqyhBgwWDBjfqkOtwa6lZUuhg6Cmb6pbgM2IQ
 JMrkvQ71BAR2RByoghMcRgQWwaXXurg1KvHP3t7GAIHkeoe4TucZct/p/V09sn1WT46x
 k6MbNHxFeKLFvx1YqJZXCYv6guUld05I4VoUvGQ/9SJhV3tpzrnZRaya/Cc/9FjWBm0j
 wElji/FOsEgFtZRYek1gylo1dlURTMemeg4OhL+jSJcvdFt4wyymdsiUTn51e1JLXVBW
 d01w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719366836; x=1719971636;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Yt1OSJl92903gzgy+xbO+teewEi8pHwOPc/OOCe+r8U=;
 b=L4UUuzsD7oKdEtZ2aRP5WTmTPupudPtOlvXvUZlU8RqbZ3rVkv5uwlsoJJ+pjdCMfQ
 ZAYIoh+Xja6T2t73tehwIzPRSNWbbKdstubkzZAV/KHum5ecvto2CTDhjWeHuYeXIr6N
 na5NU5bSFJTx1PvdShAG/ROtC2olefrtIWDBhkQ+/tkcKVoOUjnDFRtwrk/YIvoSCyHd
 r3EuH3sgn70SkkCIWBgwjJp7aBOHFqrRji954CTtxKTH3jcL5nxxDYQUu4idomTUyqpD
 rPIMGDnm7gNKccWNrZyimwrwnEIYAPBC33HSMC4kFT/mVmkiH+0S00vZEuqnxfFpO9Ng
 zFYw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUA64YlsM5Gc0uOTWacVvE8sVUiHhPTbYvrq0P52EpAP/T8yYj865b4imcGMhseTPwWgur6QjNQGd0QNU/O/PIN+zWbY6xH2D27OVb1FFdohSK2/05yMA==
X-Gm-Message-State: AOJu0YxUMEwAuF/rWxKImEcVzXs2Vc2DLHuGK+wIgppXawbLErk7SuQi
 030zOlSK8fIWF2CkNuDkIiaMeR8krutCYh4Bec6gonhCJm5JD4RUqvjK8U8UxyMA6gv8BScWaTI
 lP3GBAiBX1vhROgJE3S7wGCgymNU=
X-Google-Smtp-Source: AGHT+IHGGDT30WcdY64WppzLAUApw09NudbErIcqTouiL42vqsSl2ke/6zsJ34Zy1/mhQOcoc9GWhLB2JYkX4AJcaA4=
X-Received: by 2002:ac2:46d4:0:b0:52c:e112:4b0c with SMTP id
 2adb3069b0e04-52ce183314dmr4725882e87.9.1719366836049; Tue, 25 Jun 2024
 18:53:56 -0700 (PDT)
MIME-Version: 1.0
References: <20240625065459.3665791-1-chao@kernel.org>
 <a861d9aaf9394aa6bc77548735629f87@BJMBX02.spreadtrum.com>
 <1fe7878f-36db-4055-9e40-b39425eb5936@kernel.org>
 <CAHJ8P3Jj0SYuTgqo12r1fZxnWrx_ZH-=Cg5FUhmX4ZvRCLbROA@mail.gmail.com>
 <1516a462-1273-428d-aa3d-285bd00b7b69@kernel.org>
In-Reply-To: <1516a462-1273-428d-aa3d-285bd00b7b69@kernel.org>
From: Zhiguo Niu <niuzhiguo84@gmail.com>
Date: Wed, 26 Jun 2024 09:53:44 +0800
Message-ID: <CAHJ8P3LVUguWpDsq3NobqdxUfCvhdpdxpuC6_S1=A9X5Spb-jw@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Chao Yu 于2024年6月26日周三 09:36写道： > > On 2024/6/25
    19:07, Zhiguo Niu wrote: > > Chao Yu 于2024年6月25日周二 18:38写道：
    > >> > >> On 2024/6/25 16:09, 牛志国 (Zhiguo Niu) [...] 
 
 Content analysis details:   (0.1 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                          [209.85.167.46 listed in sa-trusted.bondedsender.org]
  0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
                             DNSWL was blocked.  See
                             http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
                              for more information.
                             [209.85.167.46 listed in list.dnswl.org]
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [209.85.167.46 listed in bl.score.senderscore.com]
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
                             in digit
                             [niuzhiguo84[at]gmail.com]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [niuzhiguo84[at]gmail.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.167.46 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
X-Headers-End: 1sMHrM-00039h-U7
Subject: Re: [f2fs-dev] =?utf-8?b?562U5aSNOiBbUEFUQ0ggdjRdIGYyZnM6IHJlZHVj?=
	=?utf-8?q?e_expensive_checkpoint_trigger_frequency?=
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>,
 =?UTF-8?B?54mb5b+X5Zu9IChaaGlndW8gTml1KQ==?= <Zhiguo.Niu@unisoc.com>,
 "jaegeuk@kernel.org" <jaegeuk@kernel.org>, wangzijie <wangzijie1@honor.com>,
 =?UTF-8?B?546L55qTIChIYW9faGFvIFdhbmcp?= <Hao_hao.Wang@unisoc.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Q2hhbyBZdSA8Y2hhb0BrZXJuZWwub3JnPiDkuo4yMDI05bm0NuaciDI25pel5ZGo5LiJIDA5OjM2
5YaZ6YGT77yaCj4KPiBPbiAyMDI0LzYvMjUgMTk6MDcsIFpoaWd1byBOaXUgd3JvdGU6Cj4gPiBD
aGFvIFl1IDxjaGFvQGtlcm5lbC5vcmc+IOS6jjIwMjTlubQ25pyIMjXml6XlkajkuowgMTg6Mzjl
hpnpgZPvvJoKPiA+Pgo+ID4+IE9uIDIwMjQvNi8yNSAxNjowOSwg54mb5b+X5Zu9IChaaGlndW8g
Tml1KSB3cm90ZToKPiA+Pj4KPiA+Pj4KPiA+Pj4gLS0tLS3pgq7ku7bljp/ku7YtLS0tLQo+ID4+
PiDlj5Hku7bkuro6IENoYW8gWXUgPGNoYW9Aa2VybmVsLm9yZz4KPiA+Pj4g5Y+R6YCB5pe26Ze0
OiAyMDI05bm0NuaciDI15pelIDE0OjU1Cj4gPj4+IOaUtuS7tuS6ujogamFlZ2V1a0BrZXJuZWwu
b3JnCj4gPj4+IOaKhOmAgTogbGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQ7
IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IENoYW8gWXUgPGNoYW9Aa2VybmVsLm9yZz47
IHdhbmd6aWppZSA8d2FuZ3ppamllMUBob25vci5jb20+OyDniZvlv5flm70gKFpoaWd1byBOaXUp
IDxaaGlndW8uTml1QHVuaXNvYy5jb20+OyBZdW5sZWkgSGUgPGhleXVubGVpQGhpaG9ub3IuY29t
Pgo+ID4+PiDkuLvpopg6IFtQQVRDSCB2NF0gZjJmczogcmVkdWNlIGV4cGVuc2l2ZSBjaGVja3Bv
aW50IHRyaWdnZXIgZnJlcXVlbmN5Cj4gPj4+Cj4gPj4+Cj4gPj4+IOazqOaEjzog6L+Z5bCB6YKu
5Lu25p2l6Ieq5LqO5aSW6YOo44CC6Zmk6Z2e5L2g56Gu5a6a6YKu5Lu25YaF5a655a6J5YWo77yM
5ZCm5YiZ5LiN6KaB54K55Ye75Lu75L2V6ZO+5o6l5ZKM6ZmE5Lu244CCCj4gPj4+IENBVVRJT046
IFRoaXMgZW1haWwgb3JpZ2luYXRlZCBmcm9tIG91dHNpZGUgb2YgdGhlIG9yZ2FuaXphdGlvbi4g
RG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSByZWNvZ25p
emUgdGhlIHNlbmRlciBhbmQga25vdyB0aGUgY29udGVudCBpcyBzYWZlLgo+ID4+Pgo+ID4+Pgo+
ID4+Pgo+ID4+PiBXZSBtYXkgdHJpZ2dlciBoaWdoIGZyZXF1ZW50IGNoZWNrcG9pbnQgZm9yIGJl
bG93IGNhc2U6Cj4gPj4+IDEuIG1rZGlyIC9tbnQvZGlyMTsgc2V0IGRpcjEgZW5jcnlwdGVkCj4g
Pj4+IDIuIHRvdWNoIC9tbnQvZmlsZTE7IGZzeW5jIC9tbnQvZmlsZTEKPiA+Pj4gMy4gbWtkaXIg
L21udC9kaXIyOyBzZXQgZGlyMiBlbmNyeXB0ZWQKPiA+Pj4gNC4gdG91Y2ggL21udC9maWxlMjsg
ZnN5bmMgL21udC9maWxlMgo+ID4+PiAuLi4KPiA+Pj4KPiA+Pj4gQWx0aG91Z2gsIG5ld2x5IGNy
ZWF0ZWQgZGlyIGFuZCBmaWxlIGFyZSBub3QgcmVsYXRlZCwgZHVlIHRvIGNvbW1pdCBiYmYxNTZm
N2FmYTcgKCJmMmZzOiBmaXggbG9zdCB4YXR0cnMgb2YgZGlyZWN0b3JpZXMiKSwgd2Ugd2lsbCB0
cmlnZ2VyIGNoZWNrcG9pbnQgd2hlbmV2ZXIgZnN5bmMoKSBjb21lcyBhZnRlciBhIG5ldyBlbmNy
eXB0ZWQgZGlyIGNyZWF0ZWQuCj4gPj4+Cj4gPj4+IEluIG9yZGVyIHRvIGF2b2lkIHN1Y2ggcGVy
Zm9ybWFuY2UgcmVncmVzc2lvbiBpc3N1ZSwgbGV0J3MgcmVjb3JkIGFuIGVudHJ5IGluY2x1ZGlu
ZyBkaXJlY3RvcnkncyBpbm8gaW4gZ2xvYmFsIGNhY2hlIHdoZW5ldmVyIHdlIHVwZGF0ZSBkaXJl
Y3RvcnkncyB4YXR0ciBkYXRhLCBhbmQgdGhlbiB0cmlnZ2VycmluZyBjaGVja3BvaW50KCkgb25s
eSBpZiB4YXR0ciBtZXRhZGF0YSBvZiB0YXJnZXQgZmlsZSdzIHBhcmVudCB3YXMgdXBkYXRlZC4K
PiA+Pj4KPiA+Pj4gVGhpcyBwYXRjaCB1cGRhdGVzIHRvIGNvdmVyIGJlbG93IG5vIGVuY3J5cHRp
b24gY2FzZSBhcyB3ZWxsOgo+ID4+PiAxKSBwYXJlbnQgaXMgY2hlY2twb2ludGVkCj4gPj4+IDIp
IHNldF94YXR0cihkaXIpIHcvIG5ldyB4bmlkCj4gPj4+IDMpIGNyZWF0ZShmaWxlKQo+ID4+PiA0
KSBmc3luYyhmaWxlKQo+ID4+Pgo+ID4+PiBGaXhlczogYmJmMTU2ZjdhZmE3ICgiZjJmczogZml4
IGxvc3QgeGF0dHJzIG9mIGRpcmVjdG9yaWVzIikKPiA+Pj4gUmVwb3J0ZWQtYnk6IHdhbmd6aWpp
ZSA8d2FuZ3ppamllMUBob25vci5jb20+Cj4gPj4+IFJlcG9ydGVkLWJ5OiBaaGlndW8gTml1IDx6
aGlndW8ubml1QHVuaXNvYy5jb20+Cj4gPj4+IFRlc3RlZC1ieTogWmhpZ3VvIE5pdSA8emhpZ3Vv
Lm5pdUB1bmlzb2MuY29tPgo+ID4+PiBSZXBvcnRlZC1ieTogWXVubGVpIEhlIDxoZXl1bmxlaUBo
aWhvbm9yLmNvbT4KPiA+Pj4gU2lnbmVkLW9mZi1ieTogQ2hhbyBZdSA8Y2hhb0BrZXJuZWwub3Jn
Pgo+ID4+PiAtLS0KPiA+Pj4gICAgZnMvZjJmcy9mMmZzLmggICAgICAgICAgICAgIHwgIDIgKysK
PiA+Pj4gICAgZnMvZjJmcy9maWxlLmMgICAgICAgICAgICAgIHwgIDMgKysrCj4gPj4+ICAgIGZz
L2YyZnMveGF0dHIuYyAgICAgICAgICAgICB8IDE0ICsrKysrKysrKysrKy0tCj4gPj4+ICAgIGlu
Y2x1ZGUvdHJhY2UvZXZlbnRzL2YyZnMuaCB8ICAzICsrLQo+ID4+PiAgICA0IGZpbGVzIGNoYW5n
ZWQsIDE5IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4gPj4+Cj4gPj4+IGRpZmYgLS1n
aXQgYS9mcy9mMmZzL2YyZnMuaCBiL2ZzL2YyZnMvZjJmcy5oIGluZGV4IGYxZDY1ZWUzYWRkZi4u
ZjNjOTEwYjg5ODNiIDEwMDY0NAo+ID4+PiAtLS0gYS9mcy9mMmZzL2YyZnMuaAo+ID4+PiArKysg
Yi9mcy9mMmZzL2YyZnMuaAo+ID4+PiBAQCAtMjg0LDYgKzI4NCw3IEBAIGVudW0gewo+ID4+PiAg
ICAgICAgICAgQVBQRU5EX0lOTywgICAgICAgICAgICAgLyogZm9yIGFwcGVuZCBpbm8gbGlzdCAq
Lwo+ID4+PiAgICAgICAgICAgVVBEQVRFX0lOTywgICAgICAgICAgICAgLyogZm9yIHVwZGF0ZSBp
bm8gbGlzdCAqLwo+ID4+PiAgICAgICAgICAgVFJBTlNfRElSX0lOTywgICAgICAgICAgLyogZm9y
IHRyYW5zYWN0aW9ucyBkaXIgaW5vIGxpc3QgKi8KPiA+Pj4gKyAgICAgICBFTkNfRElSX0lOTywg
ICAgICAgICAgICAvKiBmb3IgZW5jcnlwdGVkIGRpciBpbm8gbGlzdCAqLwo+ID4+PiAgICAgICAg
ICAgRkxVU0hfSU5PLCAgICAgICAgICAgICAgLyogZm9yIG11bHRpcGxlIGRldmljZSBmbHVzaGlu
ZyAqLwo+ID4+PiAgICAgICAgICAgTUFYX0lOT19FTlRSWSwgICAgICAgICAgLyogbWF4LiBsaXN0
ICovCj4gPj4+ICAgIH07Cj4gPj4+IEBAIC0xMTUwLDYgKzExNTEsNyBAQCBlbnVtIGNwX3JlYXNv
bl90eXBlIHsKPiA+Pj4gICAgICAgICAgIENQX0ZBU1RCT09UX01PREUsCj4gPj4+ICAgICAgICAg
ICBDUF9TUEVDX0xPR19OVU0sCj4gPj4+ICAgICAgICAgICBDUF9SRUNPVkVSX0RJUiwKPiA+Pj4g
KyAgICAgICBDUF9FTkNfRElSLAo+ID4+PiAgICB9Owo+ID4+Pgo+ID4+PiAgICBlbnVtIGlvc3Rh
dF90eXBlIHsKPiA+Pj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvZmlsZS5jIGIvZnMvZjJmcy9maWxl
LmMgaW5kZXggYTUyN2RlMWU3YTJmLi4yNzg1NzM5NzRkYjQgMTAwNjQ0Cj4gPj4+IC0tLSBhL2Zz
L2YyZnMvZmlsZS5jCj4gPj4+ICsrKyBiL2ZzL2YyZnMvZmlsZS5jCj4gPj4+IEBAIC0yMTcsNiAr
MjE3LDkgQEAgc3RhdGljIGlubGluZSBlbnVtIGNwX3JlYXNvbl90eXBlIG5lZWRfZG9fY2hlY2tw
b2ludChzdHJ1Y3QgaW5vZGUgKmlub2RlKQo+ID4+PiAgICAgICAgICAgICAgICAgICBmMmZzX2V4
aXN0X3dyaXR0ZW5fZGF0YShzYmksIEYyRlNfSShpbm9kZSktPmlfcGlubywKPiA+Pj4gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFRSQU5T
X0RJUl9JTk8pKQo+ID4+PiAgICAgICAgICAgICAgICAgICBjcF9yZWFzb24gPSBDUF9SRUNPVkVS
X0RJUjsKPiA+Pj4gKyAgICAgICBlbHNlIGlmIChmMmZzX2V4aXN0X3dyaXR0ZW5fZGF0YShzYmks
IEYyRlNfSShpbm9kZSktPmlfcGlubywKPiA+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBFTkNfRElSX0lOTykpCj4gPj4+ICsgICAgICAg
ICAgICAgICBjcF9yZWFzb24gPSBDUF9FTkNfRElSOwo+ID4+Pgo+ID4+PiAgICAgICAgICAgcmV0
dXJuIGNwX3JlYXNvbjsKPiA+Pj4gICAgfQo+ID4+PiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy94YXR0
ci5jIGIvZnMvZjJmcy94YXR0ci5jIGluZGV4IGYyOTBmZTkzMjdjNC4uZDA0YzBiNDdhNGU0IDEw
MDY0NAo+ID4+PiAtLS0gYS9mcy9mMmZzL3hhdHRyLmMKPiA+Pj4gKysrIGIvZnMvZjJmcy94YXR0
ci5jCj4gPj4+IEBAIC02MjksNiArNjI5LDcgQEAgc3RhdGljIGludCBfX2YyZnNfc2V0eGF0dHIo
c3RydWN0IGlub2RlICppbm9kZSwgaW50IGluZGV4LAo+ID4+PiAgICAgICAgICAgICAgICAgICAg
ICAgICAgIGNvbnN0IGNoYXIgKm5hbWUsIGNvbnN0IHZvaWQgKnZhbHVlLCBzaXplX3Qgc2l6ZSwK
PiA+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgcGFnZSAqaXBhZ2UsIGludCBm
bGFncykgIHsKPiA+Pj4gKyAgICAgICBzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmkgPSBGMkZTX0lf
U0IoaW5vZGUpOwo+ID4+PiAgICAgICAgICAgc3RydWN0IGYyZnNfeGF0dHJfZW50cnkgKmhlcmUs
ICpsYXN0Owo+ID4+PiAgICAgICAgICAgdm9pZCAqYmFzZV9hZGRyLCAqbGFzdF9iYXNlX2FkZHI7
Cj4gPj4+ICAgICAgICAgICBpbnQgZm91bmQsIG5ld3NpemU7Cj4gPj4+IEBAIC03NzIsOSArNzcz
LDE4IEBAIHN0YXRpYyBpbnQgX19mMmZzX3NldHhhdHRyKHN0cnVjdCBpbm9kZSAqaW5vZGUsIGlu
dCBpbmRleCwKPiA+Pj4gICAgICAgICAgIGlmIChpbmRleCA9PSBGMkZTX1hBVFRSX0lOREVYX0VO
Q1JZUFRJT04gJiYKPiA+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAhc3RyY21wKG5hbWUs
IEYyRlNfWEFUVFJfTkFNRV9FTkNSWVBUSU9OX0NPTlRFWFQpKQo+ID4+PiAgICAgICAgICAgICAg
ICAgICBmMmZzX3NldF9lbmNyeXB0ZWRfaW5vZGUoaW5vZGUpOwo+ID4+PiAtICAgICAgIGlmIChT
X0lTRElSKGlub2RlLT5pX21vZGUpKQo+ID4+PiAtICAgICAgICAgICAgICAgc2V0X3NiaV9mbGFn
KEYyRlNfSV9TQihpbm9kZSksIFNCSV9ORUVEX0NQKTsKPiA+Pj4KPiA+Pj4gKyAgICAgICBpZiAo
IVNfSVNESVIoaW5vZGUtPmlfbW9kZSkpCj4gPj4+ICsgICAgICAgICAgICAgICBnb3RvIHNhbWU7
Cj4gPj4+ICsgICAgICAgLyoKPiA+Pj4gKyAgICAgICAgKiBJbiByZXN0cmljdCBtb2RlLCBmc3lu
YygpIGFsd2F5cyB0cnkgdG8gdHJpZ2dlciBjaGVja3BvaW50IGZvciBhbGwKPiA+Pj4gKyAgICAg
ICAgKiBtZXRhZGF0YSBjb25zaXN0ZW5jeSwgaW4gb3RoZXIgbW9kZSwgaXQgdHJpZ2dlcnMgY2hl
Y2twb2ludCB3aGVuCj4gPj4+ICsgICAgICAgICogcGFyZW50J3MgeGF0dHIgbWV0YWRhdGEgd2Fz
IHVwZGF0ZWQuCj4gPj4+ICsgICAgICAgICovCj4gPj4+ICsgICAgICAgaWYgKEYyRlNfT1BUSU9O
KHNiaSkuZnN5bmNfbW9kZSA9PSBGU1lOQ19NT0RFX1NUUklDVCkKPiA+Pj4gKyAgICAgICAgICAg
ICAgIHNldF9zYmlfZmxhZyhzYmksIFNCSV9ORUVEX0NQKTsKPiA+Pj4gSGkgQ2hhbywKPiA+Pj4g
Rm9yIHRoaXMgY2FzZSwgd2lsbCBpdCBhbHNvIGNhdXNlIHRoZSBzYW1lIGlzc3VlIHdpdGggb3Jp
Z2luYWwgaXNzdWUgd2hlbiBmc3luY19tb2RlID09IEZTWU5DX01PREVfU1RSSUNUID8KPiA+Pj4g
aWYgY2twdCB0aHJlYWQgaXMgYmxvY2tlZCBieSBzb21lIHJlYXNvbnMgYW5kIFNCSV9ORUVEX0NQ
IGlzIG5vdCBjbGVhcmVkIGluIHRpbWUsIFN1YnNlcXVlbnQgZnN5bmMgd2lsbCB0cmlnZ2VyIGNw
Pwo+ID4+Cj4gPj4gSGkgWmhpZ3VvLAo+ID4+Cj4gPj4gSWYgdGhlcmUgaXMgbm8gZGlydHkgZGF0
YSBhZnRlciBwcmV2aW91cyBDUCwgbGF0ZXIgQ1AgdHJpZ2dlcmVkIGJ5IHN1YnNlcXVlbnQKPiA+
PiBmc3luYyB3aWxsIHJldHVybiBkaXJlY3RseT8KPiA+Pgo+ID4+ICAgICAgICAgIGlmICghaXNf
c2JpX2ZsYWdfc2V0KHNiaSwgU0JJX0lTX0RJUlRZKSAmJgo+ID4+ICAgICAgICAgICAgICAgICAg
KChjcGMtPnJlYXNvbiAmIENQX0ZBU1RCT09UKSB8fCAoY3BjLT5yZWFzb24gJiBDUF9TWU5DKSB8
fAo+ID4+ICAgICAgICAgICAgICAgICAgKChjcGMtPnJlYXNvbiAmIENQX0RJU0NBUkQpICYmICFz
YmktPmRpc2NhcmRfYmxrcykpKQo+ID4+ICAgICAgICAgICAgICAgICAgZ290byBvdXQ7Cj4gPgo+
ID4gSGkgQ2hhbywKPiA+IEkgbWVhbiBpbiB0aGUgY2FzZSBvZiAgRjJGU19PUFRJT04oc2JpKS5m
c3luY19tb2RlID09Cj4gPiBGU1lOQ19NT0RFX1NUUklDVCwgIHRoaXMgd2lsbCBzdGlsbCBjYXVz
ZSB0aGUgc2FtZSBpc3N1ZSB3aXRoIG9yaWdpbmFsCj4gPiBxdWVzdGlvbi4KPiA+IExldCBtZSBy
ZXBvc3QgdGhlIHByb2JsZW1zIEkgZW5jb3VudGVyZWQgLgo+ID4KPiA+IDEuc2V0X3NiaV9mbGFn
KEYyRlNfSV9TQihpbm9kZSksIFNCSV9ORUVEX0NQKTsKPiA+Cj4gPiAyLiBjcCB0aHJlYSBpcyBi
bG9ja2VkIGJ5IGlvIHJlc291cmNlCj4gPiAjMCBbZmZmZmZmYzAxNWZjYjMzMF0gX19zd2l0Y2hf
dG8gYXQgZmZmZmZmYzAxMDE5NjM1MAo+ID4gIzEgW2ZmZmZmZmMwMTVmY2IzOTBdIF9fc2NoZWR1
bGUgYXQgZmZmZmZmYzAxMTY4ZTUzYwo+ID4gIzIgW2ZmZmZmZmMwMTVmY2IzZjBdIHNjaGVkdWxl
IGF0IGZmZmZmZmMwMTE2OGVkN2MKPiA+ICMzIFtmZmZmZmZjMDE1ZmNiNDUwXSBpb19zY2hlZHVs
ZSBhdCBmZmZmZmZjMDExNjhmN2EwCj4gPiAjNCBbZmZmZmZmYzAxNWZjYjRjMF0gYmxrX21xX2dl
dF90YWcgYXQgZmZmZmZmYzAxMDEwMDhhNAo+CkhpIENoYW8KPiBJdCBzZWVtcyB0aGVyZSBpcyBu
byBmcmVlIHRhZyBhdCB0aGF0IHRpbWUsIGNhbiB5b3UgY2hlY2sgaXRzIGNvbnRleHQKPiB0byBz
ZWUgd2h5IElPIHF1ZXVlIGNhbiBiZSBjb25nZXN0ZWQgb25jZSB5b3UgY2FuIHJlcHJvZHVjZSB0
aGlzIGlzc3VlPwpZZXMsIGl0cyBtb25rZWsgdGVzdCByZXBvcnQgdGhpcyBpc3N1ZSwgYW5kIElP
IGxvYWQgaXMgaGVhdnkKPgo+IElmIHRoZSBib3R0bGVuZWNrIGlzIHBlcmZvcm1hbmNlIG9mIHN0
b3JhZ2UsIGhvdyBhYm91dCB1c2luZyBvdGhlcgo+IGZzeW5jX21vZGUgaWYgaXRzIGRhdGEgY29u
c2lzdGVuY3kgcGVyZm9ybWFjZSBtYXRjaGVzIHRoZSByZXF1aXJlbWVudC4KYWdyZWUgdGhpcywg
IHRoYW5rcyBhIGxvdC4KPgo+IFRoYW5rcywKPgo+ID4gIzUgW2ZmZmZmZmMwMTVmY2I1MzBdIGJs
a19tcV9nZXRfcmVxdWVzdCBhdCBmZmZmZmZjMDEwOTI0MWIwCj4gPiAjNiBbZmZmZmZmYzAxNWZj
YjVmMF0gYmxrX21xX21ha2VfcmVxdWVzdCBhdCBmZmZmZmZjMDEwOTIzM2JjCj4gPiAjNyBbZmZm
ZmZmYzAxNWZjYjY4MF0gZ2VuZXJpY19tYWtlX3JlcXVlc3QgYXQgZmZmZmZmYzAxMDBmYzZlYwo+
ID4gIzggW2ZmZmZmZmMwMTVmY2I3MDBdIHN1Ym1pdF9iaW8gYXQgZmZmZmZmYzAxMDBmYzNiOAo+
ID4gIzkgW2ZmZmZmZmMwMTVmY2I3NTBdIF9fc3VibWl0X2JpbyBhdCBmZmZmZmZjMDEwODFhMmUw
Cj4gPiAjMTAgW2ZmZmZmZmMwMTVmY2I3ZDBdIF9fc3VibWl0X21lcmdlZF9iaW8gYXQgZmZmZmZm
YzAxMDgxYjA3Ywo+ID4gIzExIFtmZmZmZmZjMDE1ZmNiOGEwXSBmMmZzX3N1Ym1pdF9wYWdlX3dy
aXRlIGF0IGZmZmZmZmMwMTAwZWNkM2MKPiA+ICMxMiBbZmZmZmZmYzAxNWZjYjk5MF0gZjJmc19k
b193cml0ZV9tZXRhX3BhZ2UgYXQgZmZmZmZmYzAxMDg0NTczOAo+ID4gIzEzIFtmZmZmZmZjMDE1
ZmNiOWQwXSBfX2YyZnNfd3JpdGVfbWV0YV9wYWdlIGF0IGZmZmZmZmMwMTA4MGE4ZjQKPiA+ICMx
NCBbZmZmZmZmYzAxNWZjYmI2MF0gZjJmc19zeW5jX21ldGFfcGFnZXMgYXQgZmZmZmZmYzAxMDgw
YTY4NAo+ID4gIzE1IFtmZmZmZmZjMDE1ZmNiY2EwXSBkb19jaGVja3BvaW50IGF0IGZmZmZmZmMw
MTA4MGYwYTgKPiA+ICMxNiBbZmZmZmZmYzAxNWZjYmQxMF0gZjJmc193cml0ZV9jaGVja3BvaW50
IGF0IGZmZmZmZmMwMTA4MGU1MGMKPiA+ICMxNyBbZmZmZmZmYzAxNWZjYmRiMF0gX19jaGVja3Bv
aW50X2FuZF9jb21wbGV0ZV9yZXFzIGF0IGZmZmZmZmMwMTA4MTBmNTQKPiA+ICMxOCBbZmZmZmZm
YzAxNWZjYmU0MF0gaXNzdWVfY2hlY2twb2ludF90aHJlYWQgYXQgZmZmZmZmYzAxMDgxMTNlYwo+
ID4gIzE5IFtmZmZmZmZjMDE1ZmNiZTgwXSBrdGhyZWFkIGF0IGZmZmZmZmMwMTAyNjY1YjAKPiA+
Cj4gPiAzLiBzdWJzZXF1ZW50IGZzeW5jIHdpbGwgc3RpbGwgaXNzdWUgY2twdCBiZWNhc3VlIFNC
SV9ORUVEX0NQIGlzIHNldCwKPiA+IGFuZCBpZiB0aGlzIGlzIGEgdmVyeSBpbXBvcnRhbnQgdGhy
ZWFkLCBpdCB3aWxsIGNhdXNlIHN5c3RlbSBpc3N1ZSwKPiA+IHN1Y2ggYXMgaW5pdC4KPiA+IGJ1
dCB0aGlzIGlzIHNob3VsZCBiZSBhdm9pZGVkLgo+ID4gUElEOiAyODcgICAgICBUQVNLOiBmZmZm
ZmY4MGY5ZWIwZWMwICBDUFU6IDIgICAgQ09NTUFORDogImluaXQiCj4gPgo+ID4gIzAgW2ZmZmZm
ZmMwMTM4OWJhYjBdIF9fc3dpdGNoX3RvIGF0IGZmZmZmZmMwMTAxOTYzNTAKPiA+ICMxIFtmZmZm
ZmZjMDEzODliYjEwXSBfX3NjaGVkdWxlIGF0IGZmZmZmZmMwMTE2OGU1M2MKPiA+ICMyIFtmZmZm
ZmZjMDEzODliYjcwXSBzY2hlZHVsZSBhdCBmZmZmZmZjMDExNjhlZDdjCj4gPiAjMyBbZmZmZmZm
YzAxMzg5YmJjMF0gd2FpdF9mb3JfY29tcGxldGlvbiBhdCBmZmZmZmZjMDExNjkyMzY4Cj4gPiAj
NCBbZmZmZmZmYzAxMzg5YmNhMF0gZjJmc19pc3N1ZV9jaGVja3BvaW50IGF0IGZmZmZmZmMwMTA4
MTBjYjAKPiA+ICM1IFtmZmZmZmZjMDEzODliZDAwXSBmMmZzX3N5bmNfZnMgYXQgZmZmZmZmYzAx
MDdmNGUxYwo+ID4gIzYgW2ZmZmZmZmMwMTM4OWJkYzBdIGYyZnNfZG9fc3luY19maWxlIGF0IGZm
ZmZmZmMwMTA3ZDRkNDQKPiA+ICM3IFtmZmZmZmZjMDEzODliZTIwXSBmMmZzX3N5bmNfZmlsZSBh
dCBmZmZmZmZjMDEwN2Q0OTJjCj4gPiAjOCBbZmZmZmZmYzAxMzg5YmUzMF0gX19hcm02NF9zeXNf
ZnN5bmMgYXQgZmZmZmZmYzAxMDVkMzFkOAo+ID4gIzkgW2ZmZmZmZmMwMTM4OWJlNzBdIGVsMF9z
dmNfY29tbW9uIGF0IGZmZmZmZmMwMTAxYWE1NTAKPiA+ICMxMCBbZmZmZmZmYzAxMzg5YmViMF0g
ZWwwX3N2Y19oYW5kbGVyIGF0IGZmZmZmZmMwMTAwODg2ZmMKPiA+Cj4gPiB0aGFua3MhCj4gPj4K
PiA+Pj4gKyAgICAgICBlbHNlCj4gPj4+ICsgICAgICAgICAgICAgICBmMmZzX2FkZF9pbm9fZW50
cnkoc2JpLCBpbm9kZS0+aV9pbm8sIEVOQ19ESVJfSU5PKTsKPiA+Pj4gVGhpcyBwYXRjaCB2ZXJz
aW9uIHJlZ2FyZGxlc3Mgb2Ygd2hldGhlciBkaXIgaXMgZW5jcnlwdGVkIG9yIG5vdCwgc28gdGhp
cyBuYW1lKEVOQ19ESVJfSU5PKSBjYW4gYmUgcmVuYW1lIG90aGVyIGZvciBtb3JlIGFjY3VyYXRl
Pwo+ID4+Cj4gPj4gVGhhbmtzIGZvciBwb2ludGluZyBvdXQgdGhpcywgbGV0IG1lIGZpeCBpdCBp
biB2NS4KPiA+Pgo+ID4+IFRoYW5rcywKPiA+Pgo+ID4+PiBUaGFua3PvvIEKPiA+Pj4gICAgc2Ft
ZToKPiA+Pj4gICAgICAgICAgIGlmIChpc19pbm9kZV9mbGFnX3NldChpbm9kZSwgRklfQUNMX01P
REUpKSB7Cj4gPj4+ICAgICAgICAgICAgICAgICAgIGlub2RlLT5pX21vZGUgPSBGMkZTX0koaW5v
ZGUpLT5pX2FjbF9tb2RlOyBkaWZmIC0tZ2l0IGEvaW5jbHVkZS90cmFjZS9ldmVudHMvZjJmcy5o
IGIvaW5jbHVkZS90cmFjZS9ldmVudHMvZjJmcy5oIGluZGV4IGVkNzk0YjVmZWZiZS4uZTRhOTQ5
OTVlOWE4IDEwMDY0NAo+ID4+PiAtLS0gYS9pbmNsdWRlL3RyYWNlL2V2ZW50cy9mMmZzLmgKPiA+
Pj4gKysrIGIvaW5jbHVkZS90cmFjZS9ldmVudHMvZjJmcy5oCj4gPj4+IEBAIC0xMzksNyArMTM5
LDggQEAgVFJBQ0VfREVGSU5FX0VOVU0oRVhfQkxPQ0tfQUdFKTsKPiA+Pj4gICAgICAgICAgICAg
ICAgICAgeyBDUF9OT0RFX05FRURfQ1AsICAgICAgIm5vZGUgbmVlZHMgY3AiIH0sICAgICAgICAg
ICAgICBcCj4gPj4+ICAgICAgICAgICAgICAgICAgIHsgQ1BfRkFTVEJPT1RfTU9ERSwgICAgICJm
YXN0Ym9vdCBtb2RlIiB9LCAgICAgICAgICAgICAgXAo+ID4+PiAgICAgICAgICAgICAgICAgICB7
IENQX1NQRUNfTE9HX05VTSwgICAgICAibG9nIHR5cGUgaXMgMiIgfSwgICAgICAgICAgICAgIFwK
PiA+Pj4gLSAgICAgICAgICAgICAgIHsgQ1BfUkVDT1ZFUl9ESVIsICAgICAgICJkaXIgbmVlZHMg
cmVjb3ZlcnkiIH0pCj4gPj4+ICsgICAgICAgICAgICAgICB7IENQX1JFQ09WRVJfRElSLCAgICAg
ICAiZGlyIG5lZWRzIHJlY292ZXJ5IiB9LCAgICAgICAgIFwKPiA+Pj4gKyAgICAgICAgICAgICAg
IHsgQ1BfRU5DX0RJUiwgICAgICAgICAgICJwZXJzaXN0IGVuY3J5cHRpb24gcG9saWN5IiB9KQo+
ID4+Pgo+ID4+PiAgICAjZGVmaW5lIHNob3dfc2h1dGRvd25fbW9kZSh0eXBlKSAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiA+Pj4gICAgICAgICAgIF9fcHJpbnRfc3lt
Ym9saWModHlwZSwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4g
Pj4+IC0tCj4gPj4+IDIuNDAuMQo+ID4+Pgo+ID4+Cj4gPj4KPiA+PiBfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+ID4+IExpbnV4LWYyZnMtZGV2ZWwgbWFp
bGluZyBsaXN0Cj4gPj4gTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKPiA+
PiBodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZz
LWRldmVsCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3Vy
Y2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8v
bGludXgtZjJmcy1kZXZlbAo=
