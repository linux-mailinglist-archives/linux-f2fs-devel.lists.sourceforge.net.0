Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F96E911DA6
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 21 Jun 2024 10:01:23 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sKZCn-0006H9-9J;
	Fri, 21 Jun 2024 08:01:08 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jiangshanlai@gmail.com>) id 1sKZCl-0006H2-At
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 21 Jun 2024 08:01:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=A10uLI/mw5BPIFxNPTyi9eTFLYJc1j4b8EnpD6ygN/E=; b=Im5BCoeTHzFZex1ODZByMoVXQH
 YGTqlDQU8qbnzoVee4w/zGY4nguCG2YQrHj6Gf/60dznlf5vvPqi07qmjqjUvwkJqPdPhkk2AdK69
 9z03+jqgDSTsK1eRo/VbMpajDg5GqcY+2fzJg7ollR/1WDENEQsWholzaFLt5D9RcM1Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=A10uLI/mw5BPIFxNPTyi9eTFLYJc1j4b8EnpD6ygN/E=; b=OGTD0U17R4gTWP27fzO2+ADAgI
 VD4JZ1uklQUN7kVZBzIoNqVIg2qZBXHefhAGhAb0dXBf1/NdYmD3rLXzVpCZDSFQ2zYNjAKT6khCN
 s/w51LEQ7agWXQ4t6kGOLuL+Pwch/1UGI+OyFbRyg0Ukto8ljzU8XXb39zdIhIfVVBG0=;
Received: from mail-pj1-f54.google.com ([209.85.216.54])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1sKZCk-00021M-RP for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 21 Jun 2024 08:01:06 +0000
Received: by mail-pj1-f54.google.com with SMTP id
 98e67ed59e1d1-2bfff08fc29so1458119a91.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 21 Jun 2024 01:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718956855; x=1719561655; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=A10uLI/mw5BPIFxNPTyi9eTFLYJc1j4b8EnpD6ygN/E=;
 b=dtjofWpi+/Lbw1nwo0V8drYbHhuLr58tgd/lEkHZblmk7hqeObFzA+a2oz7Qu1XaWW
 Gcw70euCBrRB/SrzAtl941btJ5E4WA7g3yPIAwlflFpUT042dPXahcAvssm0oPJEwifz
 23RjUEK1vUq35UoMeLmNsCWCTfnbFokuk8xlLzjRvTVnmLYXy2ZV3qnA3RNtDvKqCVyr
 3WwZ3blGJjcQk//S4iwrhrWxicfMW6hwzednf7DN76LwEdXNpTgr1cakiL1U2u8gjySL
 OZCvpl69heaObiErjFdfEXLQnCrW0YhFzn0jMr29jSugXU+WLBH4SVDJjWk2EXHLOCvW
 lMHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718956855; x=1719561655;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=A10uLI/mw5BPIFxNPTyi9eTFLYJc1j4b8EnpD6ygN/E=;
 b=KmOeDNrZQwlb//jmV/Y/esj2Zt1POe5GzzaFToEYEBFTC20V16ZsIp7G0yAAXVilCN
 /prwRjESAyXGNM37rLU1OvsumxeMqb8aIexb/bAamN7KdxLEQPFmaXmSjHkiuPmYtzJt
 RJG5fN4AYlqOrS5ZhftiVlB0PKIj/7gqmC30ae7QX+kUC2vpHLVFUqlYIAE8ZMN6/dwp
 b5BU2C9/x6VLZIlvrCCgmVg40xnB8l9jo/kThqI/w6toCrzdESbUpxnfuSLwfeAQj3fn
 uaWZUx29S6EAMZmaIomEWhTd5hxAv/clzne5Ie2nZnbdhnnDHwkg4Qgnac1SAdjPV0da
 yLRA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWivNGI4s12tOvxNSK5aZtqGUxoNIPMK6gQ8DA0X/xWs1uqmh1f/6GE2xjAwV7V8S0bq+3GlbN1edH7sqaIQFN5PJz5IRGR3L3FeVWlFFz7xFP7tBCu+Q==
X-Gm-Message-State: AOJu0Yw5NGuzN8yo70GyybhI4PWSNu2MjSC+RBlziaatVMcD5GDNVnHI
 QI1QktCLlIW2/sEdGAlI+6VPYw0Q2JuyWg1AugW8WXo8DcRuqFUomBMzcGBhgP5dcknY8vL8ZAT
 RP/kT6S9is+abxM0n7jR1MsoKVUI=
X-Google-Smtp-Source: AGHT+IGc68H9WcHj8y15EEUf6zY/mIOxdH/h8ZT3XcHAgoC0HxXPonbeX3d4GDnX62zQsLJSuwIM6Rj8VwETKjhkIgU=
X-Received: by 2002:a17:90a:77c8:b0:2c4:e772:a864 with SMTP id
 98e67ed59e1d1-2c7b5dc9e68mr7896458a91.40.1718956855165; Fri, 21 Jun 2024
 01:00:55 -0700 (PDT)
MIME-Version: 1.0
References: <20240621062617.595007-1-yi.sun@unisoc.com>
 <20240621062617.595007-2-yi.sun@unisoc.com>
In-Reply-To: <20240621062617.595007-2-yi.sun@unisoc.com>
From: Lai Jiangshan <jiangshanlai@gmail.com>
Date: Fri, 21 Jun 2024 16:00:43 +0800
Message-ID: <CAJhGHyASBtZ6pE3hUB=qB7qv3CQ=OAwarxNaQ=iojcFznfORpg@mail.gmail.com>
To: Yi Sun <yi.sun@unisoc.com>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Hello On Fri, Jun 21, 2024 at 2:27 PM Yi Sun wrote: > index
    4c38824f3ab4..d9969596bbc3 100644 > --- a/include/linux/workqueue_types.h
    > +++ b/include/linux/workqueue_types.h > @@ -17,6 +17,12 @@ struct work_struct
    { > atomic_long_t data; > struct list_ [...] 
 
 Content analysis details:   (-5.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
                             high trust
                             [209.85.216.54 listed in list.dnswl.org]
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [209.85.216.54 listed in bl.score.senderscore.com]
  0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
                             The query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                          [209.85.216.54 listed in sa-trusted.bondedsender.org]
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [jiangshanlai[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
  0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
                             [209.85.216.54 listed in wl.mailspike.net]
  0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1sKZCk-00021M-RP
Subject: Re: [f2fs-dev] [PATCH 1/2] workqueue: add io priority to work_struct
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
Cc: kent.overstreet@linux.dev, ebiggers@google.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 yunlongxing23@gmail.com, sunyibuaa@gmail.com, tj@kernel.org,
 jaegeuk@kernel.org, Hao_hao.Wang@unisoc.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

SGVsbG8KCk9uIEZyaSwgSnVuIDIxLCAyMDI0IGF0IDI6MjfigK9QTSBZaSBTdW4gPHlpLnN1bkB1
bmlzb2MuY29tPiB3cm90ZToKCj4gaW5kZXggNGMzODgyNGYzYWI0Li5kOTk2OTU5NmJiYzMgMTAw
NjQ0Cj4gLS0tIGEvaW5jbHVkZS9saW51eC93b3JrcXVldWVfdHlwZXMuaAo+ICsrKyBiL2luY2x1
ZGUvbGludXgvd29ya3F1ZXVlX3R5cGVzLmgKPiBAQCAtMTcsNiArMTcsMTIgQEAgc3RydWN0IHdv
cmtfc3RydWN0IHsKPiAgICAgICAgIGF0b21pY19sb25nX3QgZGF0YTsKPiAgICAgICAgIHN0cnVj
dCBsaXN0X2hlYWQgZW50cnk7Cj4gICAgICAgICB3b3JrX2Z1bmNfdCBmdW5jOwo+ICsgICAgICAg
LyogSWYgdGhlIHdvcmsgZG9lcyBzdWJtaXRfYmlvLCBpbyBwcmlvcml0eSBtYXkgYmUgbmVlZGVk
LiAqLwo+ICsgICAgICAgdW5zaWduZWQgc2hvcnQgaW9wcmlvOwo+ICsgICAgICAgLyogUmVjb3Jk
IGt3b3JrZXIncyBvcmlnaW5hbCBpbyBwcmlvcml0eS4gKi8KPiArICAgICAgIHVuc2lnbmVkIHNo
b3J0IG9yaV9pb3ByaW87Cj4gKyAgICAgICAvKiBXaGV0aGVyIHRoZSB3b3JrIGhhcyBzZXQgaW8g
cHJpb3JpdHk/ICovCj4gKyAgICAgICBsb25nIGlvcHJpb19mbGFnOwoKSSBkb24ndCBzZWUgYW55
IGlvcHJpbyBjb2RlIGJlaW5nIGludGVncmF0ZWQgaW50byB3b3JrcXVldWUgaW4geW91cgpwYXRj
aHNldCwgZnJvbSB3aGljaCB3aGF0IHlvdSBuZWVkIG1pZ2h0IGJlOgoKc3RydWN0IGlvcHJpb193
b3JrIHsKICAgICAgIC8qKioqKioqIHRoZSB3b3JrIGl0ZW0gdG8gYmUgc2NoZWR1bGVkICoqKioq
KiovCiAgICAgICBzdHJ1Y3Qgd29ya19zdHJ1Y3Qgd29yazsKCiAgICAgICAvKioqKioqKiB0aGUg
c3R1ZmYgbmVlZCBmb3IgaW9wcmlvICoqKioqKi8KCiAgICAgICAvKiBJZiB0aGUgd29yayBkb2Vz
IHN1Ym1pdF9iaW8sIGlvIHByaW9yaXR5IG1heSBiZSBuZWVkZWQuICovCiAgICAgICB1bnNpZ25l
ZCBzaG9ydCBpb3ByaW87CiAgICAgICAvKiBSZWNvcmQga3dvcmtlcidzIG9yaWdpbmFsIGlvIHBy
aW9yaXR5LiAqLwogICAgICAgdW5zaWduZWQgc2hvcnQgb3JpX2lvcHJpbzsKICAgICAgIC8qIFdo
ZXRoZXIgdGhlIHdvcmsgaGFzIHNldCBpbyBwcmlvcml0eT8gKi8KICAgICAgIGxvbmcgaW9wcmlv
X2ZsYWc7Cn0KCkFuZCBpZiBpb3ByaW8gbmVlZHMgdG8gYmUgaW50ZWdyYXRlZCBpbnRvIHdvcmtx
dWV1ZSwgaXQgc2hvdWxkIGJlIGF0dHJpYnV0ZXMKYWRkZWQgdG8gdGhlIHdvcmtxdWV1ZSBpdHNl
bGYgYXMgaW4gdGhlIHN0cnVjdCB3b3JrcXVldWVfYXR0cnMuCgpUaGFua3MKTGFpCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZl
bCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0
cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZl
bAo=
