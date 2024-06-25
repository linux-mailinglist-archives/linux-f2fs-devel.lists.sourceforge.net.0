Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B3B4B9165D7
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 25 Jun 2024 13:07:39 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sM41H-00053V-KT;
	Tue, 25 Jun 2024 11:07:28 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <niuzhiguo84@gmail.com>) id 1sM41G-00053N-Uv
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Jun 2024 11:07:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1k8CR++PA8MBzEN5wdULt6PR+WuLY3v204LHFnZGiv8=; b=YIgub95BgcqNC9QZ+6m3Eyf0UL
 T5HmFyGI3CaqG4AADWVVMJSjFRUE+MBAlNJAljPLGaNGXU9kRhtWSXl+MuH1qEW1+mMIc3CqyVIFd
 cFwiBuPSue60eCXKeW2xKyZyW6l1g/t8grulPjsup7L9lSgCqsM+IV0CerWyxQs1xJ9I=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1k8CR++PA8MBzEN5wdULt6PR+WuLY3v204LHFnZGiv8=; b=ccmAUxFdcIyMFBGWw3F/GZGrsF
 sJL213qAMjR1zFEnjLcL7kyvujN1LTG3w2M9yM9z5R/NN0EXfnA/WGjK7JMix+E6CI4OgEyV1rJsu
 LnIp50pVaieIkT/HNeebWo1iA8etuGB+6q3Ybso5qIBt2P8le/NY1QOtHUu0JVk0djjU=;
Received: from mail-wr1-f41.google.com ([209.85.221.41])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1sM41H-0002VO-5V for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Jun 2024 11:07:27 +0000
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-366e70d0330so234914f8f.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 25 Jun 2024 04:07:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719313640; x=1719918440; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1k8CR++PA8MBzEN5wdULt6PR+WuLY3v204LHFnZGiv8=;
 b=LLcouTO2W+8oU0c6Vqd6W4NwwZ4QY8OYJTGdMIH1Wpu3dOG/RrkVbFWhwRAUoM0baL
 onWpaAp1M+MgF3557Iqdy0lMPLAGXsqql/AnmsPEN+YqoFIN9nzSfP5AfXtqa0YXRkzc
 T6LBNnCTBjZcT2kenA1fDuIpRRsvo4ayiSGjFkkGKHMkFRklQtWtoBw4NFJzceZupyJ9
 Kf3/7tR+wGmbFQ6mHdeY+76s+WoAGy0MP/wW6brBur2bIGBt/yoSmu25gAyGWAYDtfaj
 wh7Zz1vipYasVnmGklgesEIzzwCzgDkLIGZbRltEskAPR2WSz6+91fYnzh/Qz9jD3mYl
 koPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719313640; x=1719918440;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1k8CR++PA8MBzEN5wdULt6PR+WuLY3v204LHFnZGiv8=;
 b=b1Yz8JrUypKBgYUQMw/WHw9TZYTsQtiXWeUYsX244470EZiehwJMJOXQdDnIDhoXhu
 HrClkfQbK9KtN19G4AeylrKH3xHoEfWdWrTFMlb2Njqh19D1ODk12q3Bi1J/EF7i9Njj
 crZnVVWvcQ665IAcKP7x7f6pMRoe5zVVv9/yv+PCmdc1xeBXg7gt/RJ6/zS1OimYO0sT
 mbjclVmaQZ6UPylnRKAoGEcW09u/bsUu+4cZTGGKFY/5vRawbzLg+bO8SnlP8r3WAZ/Y
 AC/9o250l9HNFrjtGht0BOQZ2B1hE8O9nCn3u+ekVIsKTDX3NUA7olPvEsyJD+YHuhBE
 uZ0A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXoPRMnjr/iKt+AngYyGRklxQik5v7QN57VmUG2nsGHscNUszzry9gNPIBiUrtjQdMZkg3bzjO+mPYeSsBpQ7+CeOA7sR/87I9FjFb6RaYSfnI3QT2Efg==
X-Gm-Message-State: AOJu0Yyf2oaXF3KkInshoFQTkcXlCUyTZWdtimYS5Hp/Rn+p4NsAXEL1
 y5iynQH2vUmC47iT3pqjMDIiNI6uBppRFKZ5mObSDavWgAHiZwjQ8yXC0+0dxhmGLeVXF6+y/w/
 olnoXgbkMcixy5VnVeSJLfOGoVwHiNd0w
X-Google-Smtp-Source: AGHT+IF69pOuflSOllUrwUAcK5tdahhvC52CFpj+goGmlctCdz2/olKWdjzXVtSdGvLYqsm0YEVBika7p39KaYq9cnA=
X-Received: by 2002:a05:6000:ac8:b0:366:f001:78d5 with SMTP id
 ffacd0b85a97d-366f0017a59mr4191436f8f.13.1719313639508; Tue, 25 Jun 2024
 04:07:19 -0700 (PDT)
MIME-Version: 1.0
References: <20240625065459.3665791-1-chao@kernel.org>
 <a861d9aaf9394aa6bc77548735629f87@BJMBX02.spreadtrum.com>
 <1fe7878f-36db-4055-9e40-b39425eb5936@kernel.org>
In-Reply-To: <1fe7878f-36db-4055-9e40-b39425eb5936@kernel.org>
From: Zhiguo Niu <niuzhiguo84@gmail.com>
Date: Tue, 25 Jun 2024 19:07:08 +0800
Message-ID: <CAHJ8P3Jj0SYuTgqo12r1fZxnWrx_ZH-=Cg5FUhmX4ZvRCLbROA@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Chao Yu 于2024年6月25日周二 18:38写道： > > On 2024/6/25
    16:09, 牛志国 (Zhiguo Niu) wrote: > > > > > > -----邮件原件----- >
    > 发件人: Chao Yu > > 发送时间: 2024年6月25日 [...] 
 
 Content analysis details:   (0.1 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [209.85.221.41 listed in bl.score.senderscore.com]
  0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [209.85.221.41 listed in sa-accredit.habeas.com]
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
                             in digit
                             [niuzhiguo84[at]gmail.com]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [niuzhiguo84[at]gmail.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.221.41 listed in wl.mailspike.net]
  0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
                             DNSWL was blocked.  See
                             http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
                              for more information.
                             [209.85.221.41 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
X-Headers-End: 1sM41H-0002VO-5V
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

Q2hhbyBZdSA8Y2hhb0BrZXJuZWwub3JnPiDkuo4yMDI05bm0NuaciDI15pel5ZGo5LqMIDE4OjM4
5YaZ6YGT77yaCj4KPiBPbiAyMDI0LzYvMjUgMTY6MDksIOeJm+W/l+WbvSAoWmhpZ3VvIE5pdSkg
d3JvdGU6Cj4gPgo+ID4KPiA+IC0tLS0t6YKu5Lu25Y6f5Lu2LS0tLS0KPiA+IOWPkeS7tuS6ujog
Q2hhbyBZdSA8Y2hhb0BrZXJuZWwub3JnPgo+ID4g5Y+R6YCB5pe26Ze0OiAyMDI05bm0NuaciDI1
5pelIDE0OjU1Cj4gPiDmlLbku7bkuro6IGphZWdldWtAa2VybmVsLm9yZwo+ID4g5oqE6YCBOiBs
aW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldDsgbGludXgta2VybmVsQHZnZXIu
a2VybmVsLm9yZzsgQ2hhbyBZdSA8Y2hhb0BrZXJuZWwub3JnPjsgd2FuZ3ppamllIDx3YW5nemlq
aWUxQGhvbm9yLmNvbT47IOeJm+W/l+WbvSAoWmhpZ3VvIE5pdSkgPFpoaWd1by5OaXVAdW5pc29j
LmNvbT47IFl1bmxlaSBIZSA8aGV5dW5sZWlAaGlob25vci5jb20+Cj4gPiDkuLvpopg6IFtQQVRD
SCB2NF0gZjJmczogcmVkdWNlIGV4cGVuc2l2ZSBjaGVja3BvaW50IHRyaWdnZXIgZnJlcXVlbmN5
Cj4gPgo+ID4KPiA+IOazqOaEjzog6L+Z5bCB6YKu5Lu25p2l6Ieq5LqO5aSW6YOo44CC6Zmk6Z2e
5L2g56Gu5a6a6YKu5Lu25YaF5a655a6J5YWo77yM5ZCm5YiZ5LiN6KaB54K55Ye75Lu75L2V6ZO+
5o6l5ZKM6ZmE5Lu244CCCj4gPiBDQVVUSU9OOiBUaGlzIGVtYWlsIG9yaWdpbmF0ZWQgZnJvbSBv
dXRzaWRlIG9mIHRoZSBvcmdhbml6YXRpb24uIERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0
dGFjaG1lbnRzIHVubGVzcyB5b3UgcmVjb2duaXplIHRoZSBzZW5kZXIgYW5kIGtub3cgdGhlIGNv
bnRlbnQgaXMgc2FmZS4KPiA+Cj4gPgo+ID4KPiA+IFdlIG1heSB0cmlnZ2VyIGhpZ2ggZnJlcXVl
bnQgY2hlY2twb2ludCBmb3IgYmVsb3cgY2FzZToKPiA+IDEuIG1rZGlyIC9tbnQvZGlyMTsgc2V0
IGRpcjEgZW5jcnlwdGVkCj4gPiAyLiB0b3VjaCAvbW50L2ZpbGUxOyBmc3luYyAvbW50L2ZpbGUx
Cj4gPiAzLiBta2RpciAvbW50L2RpcjI7IHNldCBkaXIyIGVuY3J5cHRlZAo+ID4gNC4gdG91Y2gg
L21udC9maWxlMjsgZnN5bmMgL21udC9maWxlMgo+ID4gLi4uCj4gPgo+ID4gQWx0aG91Z2gsIG5l
d2x5IGNyZWF0ZWQgZGlyIGFuZCBmaWxlIGFyZSBub3QgcmVsYXRlZCwgZHVlIHRvIGNvbW1pdCBi
YmYxNTZmN2FmYTcgKCJmMmZzOiBmaXggbG9zdCB4YXR0cnMgb2YgZGlyZWN0b3JpZXMiKSwgd2Ug
d2lsbCB0cmlnZ2VyIGNoZWNrcG9pbnQgd2hlbmV2ZXIgZnN5bmMoKSBjb21lcyBhZnRlciBhIG5l
dyBlbmNyeXB0ZWQgZGlyIGNyZWF0ZWQuCj4gPgo+ID4gSW4gb3JkZXIgdG8gYXZvaWQgc3VjaCBw
ZXJmb3JtYW5jZSByZWdyZXNzaW9uIGlzc3VlLCBsZXQncyByZWNvcmQgYW4gZW50cnkgaW5jbHVk
aW5nIGRpcmVjdG9yeSdzIGlubyBpbiBnbG9iYWwgY2FjaGUgd2hlbmV2ZXIgd2UgdXBkYXRlIGRp
cmVjdG9yeSdzIHhhdHRyIGRhdGEsIGFuZCB0aGVuIHRyaWdnZXJyaW5nIGNoZWNrcG9pbnQoKSBv
bmx5IGlmIHhhdHRyIG1ldGFkYXRhIG9mIHRhcmdldCBmaWxlJ3MgcGFyZW50IHdhcyB1cGRhdGVk
Lgo+ID4KPiA+IFRoaXMgcGF0Y2ggdXBkYXRlcyB0byBjb3ZlciBiZWxvdyBubyBlbmNyeXB0aW9u
IGNhc2UgYXMgd2VsbDoKPiA+IDEpIHBhcmVudCBpcyBjaGVja3BvaW50ZWQKPiA+IDIpIHNldF94
YXR0cihkaXIpIHcvIG5ldyB4bmlkCj4gPiAzKSBjcmVhdGUoZmlsZSkKPiA+IDQpIGZzeW5jKGZp
bGUpCj4gPgo+ID4gRml4ZXM6IGJiZjE1NmY3YWZhNyAoImYyZnM6IGZpeCBsb3N0IHhhdHRycyBv
ZiBkaXJlY3RvcmllcyIpCj4gPiBSZXBvcnRlZC1ieTogd2FuZ3ppamllIDx3YW5nemlqaWUxQGhv
bm9yLmNvbT4KPiA+IFJlcG9ydGVkLWJ5OiBaaGlndW8gTml1IDx6aGlndW8ubml1QHVuaXNvYy5j
b20+Cj4gPiBUZXN0ZWQtYnk6IFpoaWd1byBOaXUgPHpoaWd1by5uaXVAdW5pc29jLmNvbT4KPiA+
IFJlcG9ydGVkLWJ5OiBZdW5sZWkgSGUgPGhleXVubGVpQGhpaG9ub3IuY29tPgo+ID4gU2lnbmVk
LW9mZi1ieTogQ2hhbyBZdSA8Y2hhb0BrZXJuZWwub3JnPgo+ID4gLS0tCj4gPiAgIGZzL2YyZnMv
ZjJmcy5oICAgICAgICAgICAgICB8ICAyICsrCj4gPiAgIGZzL2YyZnMvZmlsZS5jICAgICAgICAg
ICAgICB8ICAzICsrKwo+ID4gICBmcy9mMmZzL3hhdHRyLmMgICAgICAgICAgICAgfCAxNCArKysr
KysrKysrKystLQo+ID4gICBpbmNsdWRlL3RyYWNlL2V2ZW50cy9mMmZzLmggfCAgMyArKy0KPiA+
ICAgNCBmaWxlcyBjaGFuZ2VkLCAxOSBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+ID4K
PiA+IGRpZmYgLS1naXQgYS9mcy9mMmZzL2YyZnMuaCBiL2ZzL2YyZnMvZjJmcy5oIGluZGV4IGYx
ZDY1ZWUzYWRkZi4uZjNjOTEwYjg5ODNiIDEwMDY0NAo+ID4gLS0tIGEvZnMvZjJmcy9mMmZzLmgK
PiA+ICsrKyBiL2ZzL2YyZnMvZjJmcy5oCj4gPiBAQCAtMjg0LDYgKzI4NCw3IEBAIGVudW0gewo+
ID4gICAgICAgICAgQVBQRU5EX0lOTywgICAgICAgICAgICAgLyogZm9yIGFwcGVuZCBpbm8gbGlz
dCAqLwo+ID4gICAgICAgICAgVVBEQVRFX0lOTywgICAgICAgICAgICAgLyogZm9yIHVwZGF0ZSBp
bm8gbGlzdCAqLwo+ID4gICAgICAgICAgVFJBTlNfRElSX0lOTywgICAgICAgICAgLyogZm9yIHRy
YW5zYWN0aW9ucyBkaXIgaW5vIGxpc3QgKi8KPiA+ICsgICAgICAgRU5DX0RJUl9JTk8sICAgICAg
ICAgICAgLyogZm9yIGVuY3J5cHRlZCBkaXIgaW5vIGxpc3QgKi8KPiA+ICAgICAgICAgIEZMVVNI
X0lOTywgICAgICAgICAgICAgIC8qIGZvciBtdWx0aXBsZSBkZXZpY2UgZmx1c2hpbmcgKi8KPiA+
ICAgICAgICAgIE1BWF9JTk9fRU5UUlksICAgICAgICAgIC8qIG1heC4gbGlzdCAqLwo+ID4gICB9
Owo+ID4gQEAgLTExNTAsNiArMTE1MSw3IEBAIGVudW0gY3BfcmVhc29uX3R5cGUgewo+ID4gICAg
ICAgICAgQ1BfRkFTVEJPT1RfTU9ERSwKPiA+ICAgICAgICAgIENQX1NQRUNfTE9HX05VTSwKPiA+
ICAgICAgICAgIENQX1JFQ09WRVJfRElSLAo+ID4gKyAgICAgICBDUF9FTkNfRElSLAo+ID4gICB9
Owo+ID4KPiA+ICAgZW51bSBpb3N0YXRfdHlwZSB7Cj4gPiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9m
aWxlLmMgYi9mcy9mMmZzL2ZpbGUuYyBpbmRleCBhNTI3ZGUxZTdhMmYuLjI3ODU3Mzk3NGRiNCAx
MDA2NDQKPiA+IC0tLSBhL2ZzL2YyZnMvZmlsZS5jCj4gPiArKysgYi9mcy9mMmZzL2ZpbGUuYwo+
ID4gQEAgLTIxNyw2ICsyMTcsOSBAQCBzdGF0aWMgaW5saW5lIGVudW0gY3BfcmVhc29uX3R5cGUg
bmVlZF9kb19jaGVja3BvaW50KHN0cnVjdCBpbm9kZSAqaW5vZGUpCj4gPiAgICAgICAgICAgICAg
ICAgIGYyZnNfZXhpc3Rfd3JpdHRlbl9kYXRhKHNiaSwgRjJGU19JKGlub2RlKS0+aV9waW5vLAo+
ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgVFJBTlNfRElSX0lOTykpCj4gPiAgICAgICAgICAgICAgICAgIGNwX3JlYXNvbiA9IENQX1JF
Q09WRVJfRElSOwo+ID4gKyAgICAgICBlbHNlIGlmIChmMmZzX2V4aXN0X3dyaXR0ZW5fZGF0YShz
YmksIEYyRlNfSShpbm9kZSktPmlfcGlubywKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgRU5DX0RJUl9JTk8pKQo+ID4gKyAgICAgICAg
ICAgICAgIGNwX3JlYXNvbiA9IENQX0VOQ19ESVI7Cj4gPgo+ID4gICAgICAgICAgcmV0dXJuIGNw
X3JlYXNvbjsKPiA+ICAgfQo+ID4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMveGF0dHIuYyBiL2ZzL2Yy
ZnMveGF0dHIuYyBpbmRleCBmMjkwZmU5MzI3YzQuLmQwNGMwYjQ3YTRlNCAxMDA2NDQKPiA+IC0t
LSBhL2ZzL2YyZnMveGF0dHIuYwo+ID4gKysrIGIvZnMvZjJmcy94YXR0ci5jCj4gPiBAQCAtNjI5
LDYgKzYyOSw3IEBAIHN0YXRpYyBpbnQgX19mMmZzX3NldHhhdHRyKHN0cnVjdCBpbm9kZSAqaW5v
ZGUsIGludCBpbmRleCwKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICBjb25zdCBjaGFyICpu
YW1lLCBjb25zdCB2b2lkICp2YWx1ZSwgc2l6ZV90IHNpemUsCj4gPiAgICAgICAgICAgICAgICAg
ICAgICAgICAgc3RydWN0IHBhZ2UgKmlwYWdlLCBpbnQgZmxhZ3MpICB7Cj4gPiArICAgICAgIHN0
cnVjdCBmMmZzX3NiX2luZm8gKnNiaSA9IEYyRlNfSV9TQihpbm9kZSk7Cj4gPiAgICAgICAgICBz
dHJ1Y3QgZjJmc194YXR0cl9lbnRyeSAqaGVyZSwgKmxhc3Q7Cj4gPiAgICAgICAgICB2b2lkICpi
YXNlX2FkZHIsICpsYXN0X2Jhc2VfYWRkcjsKPiA+ICAgICAgICAgIGludCBmb3VuZCwgbmV3c2l6
ZTsKPiA+IEBAIC03NzIsOSArNzczLDE4IEBAIHN0YXRpYyBpbnQgX19mMmZzX3NldHhhdHRyKHN0
cnVjdCBpbm9kZSAqaW5vZGUsIGludCBpbmRleCwKPiA+ICAgICAgICAgIGlmIChpbmRleCA9PSBG
MkZTX1hBVFRSX0lOREVYX0VOQ1JZUFRJT04gJiYKPiA+ICAgICAgICAgICAgICAgICAgICAgICAg
ICAhc3RyY21wKG5hbWUsIEYyRlNfWEFUVFJfTkFNRV9FTkNSWVBUSU9OX0NPTlRFWFQpKQo+ID4g
ICAgICAgICAgICAgICAgICBmMmZzX3NldF9lbmNyeXB0ZWRfaW5vZGUoaW5vZGUpOwo+ID4gLSAg
ICAgICBpZiAoU19JU0RJUihpbm9kZS0+aV9tb2RlKSkKPiA+IC0gICAgICAgICAgICAgICBzZXRf
c2JpX2ZsYWcoRjJGU19JX1NCKGlub2RlKSwgU0JJX05FRURfQ1ApOwo+ID4KPiA+ICsgICAgICAg
aWYgKCFTX0lTRElSKGlub2RlLT5pX21vZGUpKQo+ID4gKyAgICAgICAgICAgICAgIGdvdG8gc2Ft
ZTsKPiA+ICsgICAgICAgLyoKPiA+ICsgICAgICAgICogSW4gcmVzdHJpY3QgbW9kZSwgZnN5bmMo
KSBhbHdheXMgdHJ5IHRvIHRyaWdnZXIgY2hlY2twb2ludCBmb3IgYWxsCj4gPiArICAgICAgICAq
IG1ldGFkYXRhIGNvbnNpc3RlbmN5LCBpbiBvdGhlciBtb2RlLCBpdCB0cmlnZ2VycyBjaGVja3Bv
aW50IHdoZW4KPiA+ICsgICAgICAgICogcGFyZW50J3MgeGF0dHIgbWV0YWRhdGEgd2FzIHVwZGF0
ZWQuCj4gPiArICAgICAgICAqLwo+ID4gKyAgICAgICBpZiAoRjJGU19PUFRJT04oc2JpKS5mc3lu
Y19tb2RlID09IEZTWU5DX01PREVfU1RSSUNUKQo+ID4gKyAgICAgICAgICAgICAgIHNldF9zYmlf
ZmxhZyhzYmksIFNCSV9ORUVEX0NQKTsKPiA+IEhpIENoYW8sCj4gPiBGb3IgdGhpcyBjYXNlLCB3
aWxsIGl0IGFsc28gY2F1c2UgdGhlIHNhbWUgaXNzdWUgd2l0aCBvcmlnaW5hbCBpc3N1ZSB3aGVu
IGZzeW5jX21vZGUgPT0gRlNZTkNfTU9ERV9TVFJJQ1QgPwo+ID4gaWYgY2twdCB0aHJlYWQgaXMg
YmxvY2tlZCBieSBzb21lIHJlYXNvbnMgYW5kIFNCSV9ORUVEX0NQIGlzIG5vdCBjbGVhcmVkIGlu
IHRpbWUsIFN1YnNlcXVlbnQgZnN5bmMgd2lsbCB0cmlnZ2VyIGNwPwo+Cj4gSGkgWmhpZ3VvLAo+
Cj4gSWYgdGhlcmUgaXMgbm8gZGlydHkgZGF0YSBhZnRlciBwcmV2aW91cyBDUCwgbGF0ZXIgQ1Ag
dHJpZ2dlcmVkIGJ5IHN1YnNlcXVlbnQKPiBmc3luYyB3aWxsIHJldHVybiBkaXJlY3RseT8KPgo+
ICAgICAgICAgaWYgKCFpc19zYmlfZmxhZ19zZXQoc2JpLCBTQklfSVNfRElSVFkpICYmCj4gICAg
ICAgICAgICAgICAgICgoY3BjLT5yZWFzb24gJiBDUF9GQVNUQk9PVCkgfHwgKGNwYy0+cmVhc29u
ICYgQ1BfU1lOQykgfHwKPiAgICAgICAgICAgICAgICAgKChjcGMtPnJlYXNvbiAmIENQX0RJU0NB
UkQpICYmICFzYmktPmRpc2NhcmRfYmxrcykpKQo+ICAgICAgICAgICAgICAgICBnb3RvIG91dDsK
CkhpIENoYW8sCkkgbWVhbiBpbiB0aGUgY2FzZSBvZiAgRjJGU19PUFRJT04oc2JpKS5mc3luY19t
b2RlID09CkZTWU5DX01PREVfU1RSSUNULCAgdGhpcyB3aWxsIHN0aWxsIGNhdXNlIHRoZSBzYW1l
IGlzc3VlIHdpdGggb3JpZ2luYWwKcXVlc3Rpb24uCkxldCBtZSByZXBvc3QgdGhlIHByb2JsZW1z
IEkgZW5jb3VudGVyZWQgLgoKMS5zZXRfc2JpX2ZsYWcoRjJGU19JX1NCKGlub2RlKSwgU0JJX05F
RURfQ1ApOwoKMi4gY3AgdGhyZWEgaXMgYmxvY2tlZCBieSBpbyByZXNvdXJjZQojMCBbZmZmZmZm
YzAxNWZjYjMzMF0gX19zd2l0Y2hfdG8gYXQgZmZmZmZmYzAxMDE5NjM1MAojMSBbZmZmZmZmYzAx
NWZjYjM5MF0gX19zY2hlZHVsZSBhdCBmZmZmZmZjMDExNjhlNTNjCiMyIFtmZmZmZmZjMDE1ZmNi
M2YwXSBzY2hlZHVsZSBhdCBmZmZmZmZjMDExNjhlZDdjCiMzIFtmZmZmZmZjMDE1ZmNiNDUwXSBp
b19zY2hlZHVsZSBhdCBmZmZmZmZjMDExNjhmN2EwCiM0IFtmZmZmZmZjMDE1ZmNiNGMwXSBibGtf
bXFfZ2V0X3RhZyBhdCBmZmZmZmZjMDEwMTAwOGE0CiM1IFtmZmZmZmZjMDE1ZmNiNTMwXSBibGtf
bXFfZ2V0X3JlcXVlc3QgYXQgZmZmZmZmYzAxMDkyNDFiMAojNiBbZmZmZmZmYzAxNWZjYjVmMF0g
YmxrX21xX21ha2VfcmVxdWVzdCBhdCBmZmZmZmZjMDEwOTIzM2JjCiM3IFtmZmZmZmZjMDE1ZmNi
NjgwXSBnZW5lcmljX21ha2VfcmVxdWVzdCBhdCBmZmZmZmZjMDEwMGZjNmVjCiM4IFtmZmZmZmZj
MDE1ZmNiNzAwXSBzdWJtaXRfYmlvIGF0IGZmZmZmZmMwMTAwZmMzYjgKIzkgW2ZmZmZmZmMwMTVm
Y2I3NTBdIF9fc3VibWl0X2JpbyBhdCBmZmZmZmZjMDEwODFhMmUwCiMxMCBbZmZmZmZmYzAxNWZj
YjdkMF0gX19zdWJtaXRfbWVyZ2VkX2JpbyBhdCBmZmZmZmZjMDEwODFiMDdjCiMxMSBbZmZmZmZm
YzAxNWZjYjhhMF0gZjJmc19zdWJtaXRfcGFnZV93cml0ZSBhdCBmZmZmZmZjMDEwMGVjZDNjCiMx
MiBbZmZmZmZmYzAxNWZjYjk5MF0gZjJmc19kb193cml0ZV9tZXRhX3BhZ2UgYXQgZmZmZmZmYzAx
MDg0NTczOAojMTMgW2ZmZmZmZmMwMTVmY2I5ZDBdIF9fZjJmc193cml0ZV9tZXRhX3BhZ2UgYXQg
ZmZmZmZmYzAxMDgwYThmNAojMTQgW2ZmZmZmZmMwMTVmY2JiNjBdIGYyZnNfc3luY19tZXRhX3Bh
Z2VzIGF0IGZmZmZmZmMwMTA4MGE2ODQKIzE1IFtmZmZmZmZjMDE1ZmNiY2EwXSBkb19jaGVja3Bv
aW50IGF0IGZmZmZmZmMwMTA4MGYwYTgKIzE2IFtmZmZmZmZjMDE1ZmNiZDEwXSBmMmZzX3dyaXRl
X2NoZWNrcG9pbnQgYXQgZmZmZmZmYzAxMDgwZTUwYwojMTcgW2ZmZmZmZmMwMTVmY2JkYjBdIF9f
Y2hlY2twb2ludF9hbmRfY29tcGxldGVfcmVxcyBhdCBmZmZmZmZjMDEwODEwZjU0CiMxOCBbZmZm
ZmZmYzAxNWZjYmU0MF0gaXNzdWVfY2hlY2twb2ludF90aHJlYWQgYXQgZmZmZmZmYzAxMDgxMTNl
YwojMTkgW2ZmZmZmZmMwMTVmY2JlODBdIGt0aHJlYWQgYXQgZmZmZmZmYzAxMDI2NjViMAoKMy4g
c3Vic2VxdWVudCBmc3luYyB3aWxsIHN0aWxsIGlzc3VlIGNrcHQgYmVjYXN1ZSBTQklfTkVFRF9D
UCBpcyBzZXQsCmFuZCBpZiB0aGlzIGlzIGEgdmVyeSBpbXBvcnRhbnQgdGhyZWFkLCBpdCB3aWxs
IGNhdXNlIHN5c3RlbSBpc3N1ZSwKc3VjaCBhcyBpbml0LgpidXQgdGhpcyBpcyBzaG91bGQgYmUg
YXZvaWRlZC4KUElEOiAyODcgICAgICBUQVNLOiBmZmZmZmY4MGY5ZWIwZWMwICBDUFU6IDIgICAg
Q09NTUFORDogImluaXQiCgojMCBbZmZmZmZmYzAxMzg5YmFiMF0gX19zd2l0Y2hfdG8gYXQgZmZm
ZmZmYzAxMDE5NjM1MAojMSBbZmZmZmZmYzAxMzg5YmIxMF0gX19zY2hlZHVsZSBhdCBmZmZmZmZj
MDExNjhlNTNjCiMyIFtmZmZmZmZjMDEzODliYjcwXSBzY2hlZHVsZSBhdCBmZmZmZmZjMDExNjhl
ZDdjCiMzIFtmZmZmZmZjMDEzODliYmMwXSB3YWl0X2Zvcl9jb21wbGV0aW9uIGF0IGZmZmZmZmMw
MTE2OTIzNjgKIzQgW2ZmZmZmZmMwMTM4OWJjYTBdIGYyZnNfaXNzdWVfY2hlY2twb2ludCBhdCBm
ZmZmZmZjMDEwODEwY2IwCiM1IFtmZmZmZmZjMDEzODliZDAwXSBmMmZzX3N5bmNfZnMgYXQgZmZm
ZmZmYzAxMDdmNGUxYwojNiBbZmZmZmZmYzAxMzg5YmRjMF0gZjJmc19kb19zeW5jX2ZpbGUgYXQg
ZmZmZmZmYzAxMDdkNGQ0NAojNyBbZmZmZmZmYzAxMzg5YmUyMF0gZjJmc19zeW5jX2ZpbGUgYXQg
ZmZmZmZmYzAxMDdkNDkyYwojOCBbZmZmZmZmYzAxMzg5YmUzMF0gX19hcm02NF9zeXNfZnN5bmMg
YXQgZmZmZmZmYzAxMDVkMzFkOAojOSBbZmZmZmZmYzAxMzg5YmU3MF0gZWwwX3N2Y19jb21tb24g
YXQgZmZmZmZmYzAxMDFhYTU1MAojMTAgW2ZmZmZmZmMwMTM4OWJlYjBdIGVsMF9zdmNfaGFuZGxl
ciBhdCBmZmZmZmZjMDEwMDg4NmZjCgp0aGFua3MhCj4KPiA+ICsgICAgICAgZWxzZQo+ID4gKyAg
ICAgICAgICAgICAgIGYyZnNfYWRkX2lub19lbnRyeShzYmksIGlub2RlLT5pX2lubywgRU5DX0RJ
Ul9JTk8pOwo+ID4gVGhpcyBwYXRjaCB2ZXJzaW9uIHJlZ2FyZGxlc3Mgb2Ygd2hldGhlciBkaXIg
aXMgZW5jcnlwdGVkIG9yIG5vdCwgc28gdGhpcyBuYW1lKEVOQ19ESVJfSU5PKSBjYW4gYmUgcmVu
YW1lIG90aGVyIGZvciBtb3JlIGFjY3VyYXRlPwo+Cj4gVGhhbmtzIGZvciBwb2ludGluZyBvdXQg
dGhpcywgbGV0IG1lIGZpeCBpdCBpbiB2NS4KPgo+IFRoYW5rcywKPgo+ID4gVGhhbmtz77yBCj4g
PiAgIHNhbWU6Cj4gPiAgICAgICAgICBpZiAoaXNfaW5vZGVfZmxhZ19zZXQoaW5vZGUsIEZJX0FD
TF9NT0RFKSkgewo+ID4gICAgICAgICAgICAgICAgICBpbm9kZS0+aV9tb2RlID0gRjJGU19JKGlu
b2RlKS0+aV9hY2xfbW9kZTsgZGlmZiAtLWdpdCBhL2luY2x1ZGUvdHJhY2UvZXZlbnRzL2YyZnMu
aCBiL2luY2x1ZGUvdHJhY2UvZXZlbnRzL2YyZnMuaCBpbmRleCBlZDc5NGI1ZmVmYmUuLmU0YTk0
OTk1ZTlhOCAxMDA2NDQKPiA+IC0tLSBhL2luY2x1ZGUvdHJhY2UvZXZlbnRzL2YyZnMuaAo+ID4g
KysrIGIvaW5jbHVkZS90cmFjZS9ldmVudHMvZjJmcy5oCj4gPiBAQCAtMTM5LDcgKzEzOSw4IEBA
IFRSQUNFX0RFRklORV9FTlVNKEVYX0JMT0NLX0FHRSk7Cj4gPiAgICAgICAgICAgICAgICAgIHsg
Q1BfTk9ERV9ORUVEX0NQLCAgICAgICJub2RlIG5lZWRzIGNwIiB9LCAgICAgICAgICAgICAgXAo+
ID4gICAgICAgICAgICAgICAgICB7IENQX0ZBU1RCT09UX01PREUsICAgICAiZmFzdGJvb3QgbW9k
ZSIgfSwgICAgICAgICAgICAgIFwKPiA+ICAgICAgICAgICAgICAgICAgeyBDUF9TUEVDX0xPR19O
VU0sICAgICAgImxvZyB0eXBlIGlzIDIiIH0sICAgICAgICAgICAgICBcCj4gPiAtICAgICAgICAg
ICAgICAgeyBDUF9SRUNPVkVSX0RJUiwgICAgICAgImRpciBuZWVkcyByZWNvdmVyeSIgfSkKPiA+
ICsgICAgICAgICAgICAgICB7IENQX1JFQ09WRVJfRElSLCAgICAgICAiZGlyIG5lZWRzIHJlY292
ZXJ5IiB9LCAgICAgICAgIFwKPiA+ICsgICAgICAgICAgICAgICB7IENQX0VOQ19ESVIsICAgICAg
ICAgICAicGVyc2lzdCBlbmNyeXB0aW9uIHBvbGljeSIgfSkKPiA+Cj4gPiAgICNkZWZpbmUgc2hv
d19zaHV0ZG93bl9tb2RlKHR5cGUpICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgXAo+ID4gICAgICAgICAgX19wcmludF9zeW1ib2xpYyh0eXBlLCAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiA+IC0tCj4gPiAyLjQwLjEKPiA+Cj4KPgo+IF9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gTGludXgtZjJm
cy1kZXZlbCBtYWlsaW5nIGxpc3QKPiBMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdl
Lm5ldAo+IGh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4
LWYyZnMtZGV2ZWwKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3Rz
LnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0
aW5mby9saW51eC1mMmZzLWRldmVsCg==
