Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E097EA2B7E8
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  7 Feb 2025 02:30:49 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tgDCa-00016g-8A;
	Fri, 07 Feb 2025 01:30:40 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <niuzhiguo84@gmail.com>) id 1tgDCZ-00016U-9S
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 07 Feb 2025 01:30:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1uMOzFUJ0RWEOZyqokJBL9zPhE0ILKpWtf9ZWvrFRXM=; b=eYVuFofiLf3iGsJxDGOhT3fDj+
 1yXpuy1G2yroqszGYg4UIDehs3/TP7ISl4bYE+F1syMwHWKalyZ7fZur8nEtdaOtauV+xikkIrR6W
 S7Dqnr4A/f5xQS7ruGWMg3ZzxuZw8bGZEfxY2QbgOWzI/2G14O+2IDTfmFJjgWzvd05U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1uMOzFUJ0RWEOZyqokJBL9zPhE0ILKpWtf9ZWvrFRXM=; b=N0b097dfXLt8XUmZzzXNltT1dj
 jWwao+XWrFe2fZFTVWIhdi6s61Zo2XdnSJUMLbmEjWW3mRU3tPGGxIJgqTibj1BfeVf+MfL2jPuRh
 p9c1dzQbfE104QumJ6rZfu5U+MdLzb0P0eUB7tNoIjs/XnvOIn/CIbXwJkLgD+zcie64=;
Received: from mail-wr1-f48.google.com ([209.85.221.48])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1tgDCY-0000TR-6J for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 07 Feb 2025 01:30:39 +0000
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-38c62ef85daso217846f8f.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 06 Feb 2025 17:30:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738891827; x=1739496627; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1uMOzFUJ0RWEOZyqokJBL9zPhE0ILKpWtf9ZWvrFRXM=;
 b=epgrZwPEJcOmIsGKUb0G9y1S9wooGSVfpQnoSpLcg0ERrgLB+rRsC9L3IuuvuSdLr5
 x1rxnxF17ZDNci5j6sDso1cyj68C+nqV3ou15vIPoVoPZvPvTb+V2JjZu58NutYDnSE/
 iOnl2c7agm4EkaF/OV7HzIR4iZEruMNOzqu4U39+nsjYF+UmdFqBZDrsB805K+gbGG3v
 34TxzecED55NW/44EO7daIg9WA56XUhfinfYm6xTS6v1c1ZGcXgnb5Z1Ok8zUd3c86d5
 bVmkFlf4xWR0i6v/YKqztMeLvF3WM4DUA6r0oPXqV3zJy2TKOSWqamVaBcFmGEs+Yq7P
 51eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738891827; x=1739496627;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1uMOzFUJ0RWEOZyqokJBL9zPhE0ILKpWtf9ZWvrFRXM=;
 b=nYJ1+qHxFZW6c0GZfDGWZdlzY6Ea2baTRqI9vfQNWIsBwY0u5iqNERabYTH00ZyZu4
 jFbKAlVVkumyO6wsLtF3KWk0/w4RwTSfIRo/huQ6HJvHvalGQMf1vXzrAXrz6sZRo6fE
 JjrbYvgC0pFS86yyFYz7p5upJu3qn3Uub6Qdw2CvFGSaAK1M7Qk6325Q0mNZa3nF42OP
 LVQlYLvp/6oZdPzupQe0DNgABegArVtuMMoNwxSmnvVi+ljYwhk+tEv2cYg4isasLoka
 WAVDG3Tp0PER791d4SKykZ7YIjNu3JxUF+CG1TrB9OzCz7bjUgV8J+7w5PnW9HZIdvW7
 P4dQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUdsNoVFIeFJtNPzEFrKuii+NQOrzbHMZ8B+JtTbj2gqzE5INQM/WieUzj6yNslhgKY2RfhutPZ6SNNkKhyOT2K@lists.sourceforge.net
X-Gm-Message-State: AOJu0YwqAOSzlRrN4zPO9mquXBMKSSHDuZFd+FhRI5HmsU0lAXPrk+/x
 Tfelokm9tV64SKORKqKdXmRC9jaYAJZ0FGDcZZ80aWIlgMx3Ec9jcwkDSFSyRQQ8epSPA+O5x0j
 0G84Xu55/zmJ+z2xAbK2lLuz5EKw=
X-Gm-Gg: ASbGncvVK5eP0+0Cq9URPrqBsyMbQFxQisKSIXETZRvGPdKXCpDSRzSm8jPu/xhTkbT
 GaWGBdPZFGun/jb6X5HYD8ht+mGjzi32bPcLH3AzKg8KBHrmg9SRACPEOOqydM5KoGXRZYkTRQA
 ==
X-Google-Smtp-Source: AGHT+IHkKqk36wyLNWQXPc1rTH5oqjNZtdra7Wh0WBbQU5p7HtzkfQwNBwQYN6hWb3yB370iRKkjiASFgG+oH8H8HgY=
X-Received: by 2002:a5d:5f46:0:b0:385:edd4:1242 with SMTP id
 ffacd0b85a97d-38dc9134bf7mr258920f8f.10.1738891826302; Thu, 06 Feb 2025
 17:30:26 -0800 (PST)
MIME-Version: 1.0
References: <20250206064451.3088028-1-chao@kernel.org>
In-Reply-To: <20250206064451.3088028-1-chao@kernel.org>
From: Zhiguo Niu <niuzhiguo84@gmail.com>
Date: Fri, 7 Feb 2025 09:30:14 +0800
X-Gm-Features: AWEUYZlOojNoY1jkzCfM7QS23nbqroecnxx-dkl-XPZh_DFq3wgurfRi7IG0Ru0
Message-ID: <CAHJ8P3+4RVNN0xB48D8aQ54ox399O0wc51YX2_At1heXWQrt4A@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Chao Yu via Linux-f2fs-devel 于2025年2月6日周四 14:50写道：
    > > F2FS-fs (dm-59): checkpoint=enable has some unwritten data. > > [ cut
    here ] > WARNING: CPU: 6 PID: 8 [...] 
 
 Content analysis details:   (0.1 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
                             in digit
                             [niuzhiguo84[at]gmail.com]
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [209.85.221.48 listed in bl.score.senderscore.com]
  0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
                             The query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [209.85.221.48 listed in sa-accredit.habeas.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [niuzhiguo84[at]gmail.com]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.221.48 listed in list.dnswl.org]
  0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.221.48 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
X-Headers-End: 1tgDCY-0000TR-6J
Subject: Re: [f2fs-dev] [PATCH] f2fs: quota: fix to avoid warning in
 dquot_writeback_dquots()
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

Q2hhbyBZdSB2aWEgTGludXgtZjJmcy1kZXZlbCA8bGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3Vy
Y2Vmb3JnZS5uZXQ+CuS6jjIwMjXlubQy5pyINuaXpeWRqOWbmyAxNDo1MOWGmemBk++8mgo+Cj4g
RjJGUy1mcyAoZG0tNTkpOiBjaGVja3BvaW50PWVuYWJsZSBoYXMgc29tZSB1bndyaXR0ZW4gZGF0
YS4KPgo+IC0tLS0tLS0tLS0tLVsgY3V0IGhlcmUgXS0tLS0tLS0tLS0tLQo+IFdBUk5JTkc6IENQ
VTogNiBQSUQ6IDgwMTMgYXQgZnMvcXVvdGEvZHF1b3QuYzo2OTEgZHF1b3Rfd3JpdGViYWNrX2Rx
dW90cysweDJmYy8weDMwOAo+IHBjIDogZHF1b3Rfd3JpdGViYWNrX2RxdW90cysweDJmYy8weDMw
OAo+IGxyIDogZjJmc19xdW90YV9zeW5jKzB4Y2MvMHgxYzQKPiBDYWxsIHRyYWNlOgo+IGRxdW90
X3dyaXRlYmFja19kcXVvdHMrMHgyZmMvMHgzMDgKPiBmMmZzX3F1b3RhX3N5bmMrMHhjYy8weDFj
NAo+IGYyZnNfd3JpdGVfY2hlY2twb2ludCsweDNkNC8weDliMAo+IGYyZnNfaXNzdWVfY2hlY2tw
b2ludCsweDFiYy8weDJjMAo+IGYyZnNfc3luY19mcysweDU0LzB4MTUwCj4gZjJmc19kb19zeW5j
X2ZpbGUrMHgyZjgvMHg4MTQKPiBfX2YyZnNfaW9jdGwrMHgxOTYwLzB4MzI0NAo+IGYyZnNfaW9j
dGwrMHg1NC8weGUwCj4gX19hcm02NF9zeXNfaW9jdGwrMHhhOC8weGU0Cj4gaW52b2tlX3N5c2Nh
bGwrMHg1OC8weDExNAo+Cj4gY2hlY2twb2ludCBhbmQgZjJmc19yZW1vdW50IG1heSByYWNlIGFz
IGJlbG93LCByZXN1bHRpbmcgdHJpZ2dlcmluZyB3YXJuaW5nCj4gaW4gZHF1b3Rfd3JpdGViYWNr
X2RxdW90cygpLgo+Cj4gYXRvbWljIHdyaXRlICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgcmVtb3VudAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIC0gZG9fcmVtb3VudAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAtIGRvd25fd3JpdGUoJnNiLT5zX3Vtb3VudCk7Cj4gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtIGYyZnNfcmVtb3VudAo+IC0g
aW9jdGwKPiAgLSBmMmZzX2RvX3N5bmNfZmlsZQo+ICAgLSBmMmZzX3N5bmNfZnMKPiAgICAtIGYy
ZnNfd3JpdGVfY2hlY2twb2ludAo+ICAgICAtIGJsb2NrX29wZXJhdGlvbnMKPiAgICAgIC0gbG9j
a2VkID0gZG93bl9yZWFkX3RyeWxvY2soJnNiaS0+c2ItPnNfdW1vdW50KQo+ICAgICAgICA6IGZh
aWwgdG8gbG9jayBkdWUgdG8gdGhlIHdyaXRlIGxvY2sgd2FzIGhlbGQgYnkgcmVtb3VudAo+ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtIHVwX3dyaXRl
KCZzYi0+c191bW91bnQpOwo+ICAgICAgLSBmMmZzX3F1b3RhX3N5bmMKPiAgICAgICAtIGRxdW90
X3dyaXRlYmFja19kcXVvdHMKPiAgICAgICAgLSBXQVJOX09OX09OQ0UoIXJ3c2VtX2lzX2xvY2tl
ZCgmc2ItPnNfdW1vdW50KSkKPiAgICAgICAgOiB0cmlnZ2VyIHdhcm5pbmcgYmVjYXVzZSBzX3Vt
b3VudCBsb2NrIHdhcyB1bmxvY2tlZCBieSByZW1vdW50Cj4KPiBJZiBjaGVja3BvaW50IGNvbWVz
IGZyb20gbW91bnQvdW1vdW50L3JlbW91bnQvZnJlZXplL3F1b3RhY3RsLCBjYWxsZXIgb2YKPiBj
aGVja3BvaW50IGhhcyBhbHJlYWR5IGhlbGQgc191bW91bnQgbG9jaywgY2FsbGluZyBkcXVvdF93
cml0ZWJhY2tfZHF1b3RzKCkKPiBpbiB0aGUgY29udGV4dCBzaG91bGQgYmUgc2FmZS4KPgo+IFNv
IGxldCdzIHJlY29yZCB0YXNrIHRvIHNiaS0+dW1vdW50X2xvY2tfaG9sZGVyLCBzbyB0aGF0IGNo
ZWNrcG9pbnQgY2FuCj4ga25vdyB3aGV0aGVyIHRoZSBsb2NrIGhhcyBoZWxkIGluIHRoZSBjb250
ZXh0IG9yIG5vdCBieSBjaGVja2luZyBjdXJyZW50Cj4gdy8gaXQuCj4KPiBJbiBhZGRpdGlvbiwg
aW4gb3JkZXIgdG8gbWlzcmVwcmVzZW50IGNhbGxlciBvZiBjaGVja3BvaW50LCB3ZSBzaG91bGQg
bm90Cj4gYWxsb3cgdG8gdHJpZ2dlciBhc3luYyBjaGVja3BvaW50IGZvciB0aG9zZSBjYWxsZXJz
OiBtb3VudC91bW91bnQvcmVtb3VudC8KPiBmcmVlemUvcXVvdGFjdGwuCj4KPiBGaXhlczogYWYw
MzNiMmFhOGE4ICgiZjJmczogZ3VhcmFudGVlIGpvdXJuYWxsZWQgcXVvdGEgZGF0YSBieSBjaGVj
a3BvaW50IikKPiBTaWduZWQtb2ZmLWJ5OiBDaGFvIFl1IDxjaGFvQGtlcm5lbC5vcmc+Cj4gLS0t
Cj4gIGZzL2YyZnMvY2hlY2twb2ludC5jIHwgMTcgKysrKysrKystLS0tLQo+ICBmcy9mMmZzL2Yy
ZnMuaCAgICAgICB8ICAzICsrLQo+ICBmcy9mMmZzL3N1cGVyLmMgICAgICB8IDU5ICsrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tCj4gIDMgZmlsZXMgY2hhbmdlZCwg
NjAgaW5zZXJ0aW9ucygrKSwgMTkgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZnMvZjJm
cy9jaGVja3BvaW50LmMgYi9mcy9mMmZzL2NoZWNrcG9pbnQuYwo+IGluZGV4IGVmZGE5YTAyMjk4
MS4uYmFmZjYzOWFjMGM0IDEwMDY0NAo+IC0tLSBhL2ZzL2YyZnMvY2hlY2twb2ludC5jCj4gKysr
IGIvZnMvZjJmcy9jaGVja3BvaW50LmMKPiBAQCAtMTIzNyw3ICsxMjM3LDggQEAgc3RhdGljIGlu
dCBibG9ja19vcGVyYXRpb25zKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSkKPiAgcmV0cnlfZmx1
c2hfcXVvdGFzOgo+ICAgICAgICAgZjJmc19sb2NrX2FsbChzYmkpOwo+ICAgICAgICAgaWYgKF9f
bmVlZF9mbHVzaF9xdW90YShzYmkpKSB7Cj4gLSAgICAgICAgICAgICAgIGludCBsb2NrZWQ7Cj4g
KyAgICAgICAgICAgICAgIGJvb2wgbmVlZF9sb2NrID0gc2JpLT51bW91bnRfbG9ja19ob2xkZXIg
IT0gY3VycmVudDsKPiArICAgICAgICAgICAgICAgYm9vbCBsb2NrZWQgPSBmYWxzZTsKPgo+ICAg
ICAgICAgICAgICAgICBpZiAoKytjbnQgPiBERUZBVUxUX1JFVFJZX1FVT1RBX0ZMVVNIX0NPVU5U
KSB7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgc2V0X3NiaV9mbGFnKHNiaSwgU0JJX1FVT1RB
X1NLSVBfRkxVU0gpOwo+IEBAIC0xMjQ2LDEwICsxMjQ3LDEzIEBAIHN0YXRpYyBpbnQgYmxvY2tf
b3BlcmF0aW9ucyhzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmkpCj4gICAgICAgICAgICAgICAgIH0K
PiAgICAgICAgICAgICAgICAgZjJmc191bmxvY2tfYWxsKHNiaSk7Cj4KPiAtICAgICAgICAgICAg
ICAgLyogb25seSBmYWlsZWQgZHVyaW5nIG1vdW50L3Vtb3VudC9mcmVlemUvcXVvdGFjdGwgKi8K
PiAtICAgICAgICAgICAgICAgbG9ja2VkID0gZG93bl9yZWFkX3RyeWxvY2soJnNiaS0+c2ItPnNf
dW1vdW50KTsKPiAtICAgICAgICAgICAgICAgZjJmc19xdW90YV9zeW5jKHNiaS0+c2IsIC0xKTsK
PiAtICAgICAgICAgICAgICAgaWYgKGxvY2tlZCkKPiArICAgICAgICAgICAgICAgLyogZG9uJ3Qg
Z3JhYiBzX3Vtb3VudCBsb2NrIGR1cmluZyBtb3VudC91bW91bnQvcmVtb3VudC9mcmVlemUvcXVv
dGFjdGwgKi8KPiArICAgICAgICAgICAgICAgaWYgKG5lZWRfbG9jayAmJiAhZG93bl9yZWFkX3Ry
eWxvY2soJnNiaS0+c2ItPnNfdW1vdW50KSkgewo+ICsgICAgICAgICAgICAgICAgICAgICAgIGNv
bmRfcmVzY2hlZCgpOwo+ICsgICAgICAgICAgICAgICAgICAgICAgIGdvdG8gcmV0cnlfZmx1c2hf
cXVvdGFzOwo+ICsgICAgICAgICAgICAgICB9Cj4gKyAgICAgICAgICAgICAgIGYyZnNfZG9fcXVv
dGFfc3luYyhzYmktPnNiLCAtMSk7Cj4gKyAgICAgICAgICAgICAgIGlmIChuZWVkX2xvY2spCj4g
ICAgICAgICAgICAgICAgICAgICAgICAgdXBfcmVhZCgmc2JpLT5zYi0+c191bW91bnQpOwo+ICAg
ICAgICAgICAgICAgICBjb25kX3Jlc2NoZWQoKTsKPiAgICAgICAgICAgICAgICAgZ290byByZXRy
eV9mbHVzaF9xdW90YXM7Cj4gQEAgLTE4NjcsNyArMTg3MSw4IEBAIGludCBmMmZzX2lzc3VlX2No
ZWNrcG9pbnQoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpKQo+ICAgICAgICAgc3RydWN0IGNwX2Nv
bnRyb2wgY3BjOwo+Cj4gICAgICAgICBjcGMucmVhc29uID0gX19nZXRfY3BfcmVhc29uKHNiaSk7
Cj4gLSAgICAgICBpZiAoIXRlc3Rfb3B0KHNiaSwgTUVSR0VfQ0hFQ0tQT0lOVCkgfHwgY3BjLnJl
YXNvbiAhPSBDUF9TWU5DKSB7Cj4gKyAgICAgICBpZiAoIXRlc3Rfb3B0KHNiaSwgTUVSR0VfQ0hF
Q0tQT0lOVCkgfHwgY3BjLnJlYXNvbiAhPSBDUF9TWU5DIHx8Cj4gKyAgICAgICAgICAgICAgIHNi
aS0+dW1vdW50X2xvY2tfaG9sZGVyID09IGN1cnJlbnQpIHsKPiAgICAgICAgICAgICAgICAgaW50
IHJldDsKPgo+ICAgICAgICAgICAgICAgICBmMmZzX2Rvd25fd3JpdGUoJnNiaS0+Z2NfbG9jayk7
Cj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvZjJmcy5oIGIvZnMvZjJmcy9mMmZzLmgKPiBpbmRleCA2
MmI3ZmVkMTUxNGEuLjcxNzRkZWE2NDFlOSAxMDA2NDQKPiAtLS0gYS9mcy9mMmZzL2YyZnMuaAo+
ICsrKyBiL2ZzL2YyZnMvZjJmcy5oCj4gQEAgLTE2NzAsNiArMTY3MCw3IEBAIHN0cnVjdCBmMmZz
X3NiX2luZm8gewo+Cj4gICAgICAgICB1bnNpZ25lZCBpbnQgbnF1b3RhX2ZpbGVzOyAgICAgICAg
ICAgICAgLyogIyBvZiBxdW90YSBzeXNmaWxlICovCj4gICAgICAgICBzdHJ1Y3QgZjJmc19yd3Nl
bSBxdW90YV9zZW07ICAgICAgICAgICAgLyogYmxvY2tpbmcgY3AgZm9yIGZsYWdzICovCj4gKyAg
ICAgICBzdHJ1Y3QgdGFza19zdHJ1Y3QgKnVtb3VudF9sb2NrX2hvbGRlcjsgLyogc191bW91bnQg
bG9jayBob2xkZXIgKi8KPgo+ICAgICAgICAgLyogIyBvZiBwYWdlcywgc2VlIGNvdW50X3R5cGUg
Ki8KPiAgICAgICAgIGF0b21pY190IG5yX3BhZ2VzW05SX0NPVU5UX1RZUEVdOwo+IEBAIC0zNjUy
LDcgKzM2NTMsNyBAQCBpbnQgZjJmc19pbm9kZV9kaXJ0aWVkKHN0cnVjdCBpbm9kZSAqaW5vZGUs
IGJvb2wgc3luYyk7Cj4gIHZvaWQgZjJmc19pbm9kZV9zeW5jZWQoc3RydWN0IGlub2RlICppbm9k
ZSk7Cj4gIGludCBmMmZzX2RxdW90X2luaXRpYWxpemUoc3RydWN0IGlub2RlICppbm9kZSk7Cj4g
IGludCBmMmZzX2VuYWJsZV9xdW90YV9maWxlcyhzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmksIGJv
b2wgcmRvbmx5KTsKPiAtaW50IGYyZnNfcXVvdGFfc3luYyhzdHJ1Y3Qgc3VwZXJfYmxvY2sgKnNi
LCBpbnQgdHlwZSk7Cj4gK2ludCBmMmZzX2RvX3F1b3RhX3N5bmMoc3RydWN0IHN1cGVyX2Jsb2Nr
ICpzYiwgaW50IHR5cGUpOwo+ICBsb2ZmX3QgbWF4X2ZpbGVfYmxvY2tzKHN0cnVjdCBpbm9kZSAq
aW5vZGUpOwo+ICB2b2lkIGYyZnNfcXVvdGFfb2ZmX3Vtb3VudChzdHJ1Y3Qgc3VwZXJfYmxvY2sg
KnNiKTsKPiAgdm9pZCBmMmZzX3NhdmVfZXJyb3JzKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwg
dW5zaWduZWQgY2hhciBmbGFnKTsKPiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9zdXBlci5jIGIvZnMv
ZjJmcy9zdXBlci5jCj4gaW5kZXggZWY2MzlhNmQ4MmU1Li5jYjlkN2I2ZmEzYWQgMTAwNjQ0Cj4g
LS0tIGEvZnMvZjJmcy9zdXBlci5jCj4gKysrIGIvZnMvZjJmcy9zdXBlci5jCj4gQEAgLTE3NDAs
MjIgKzE3NDAsMjggQEAgaW50IGYyZnNfc3luY19mcyhzdHJ1Y3Qgc3VwZXJfYmxvY2sgKnNiLCBp
bnQgc3luYykKPgo+ICBzdGF0aWMgaW50IGYyZnNfZnJlZXplKHN0cnVjdCBzdXBlcl9ibG9jayAq
c2IpCj4gIHsKPiArICAgICAgIHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSA9IEYyRlNfU0Ioc2Ip
Owo+ICsKPiAgICAgICAgIGlmIChmMmZzX3JlYWRvbmx5KHNiKSkKPiAgICAgICAgICAgICAgICAg
cmV0dXJuIDA7Cj4KPiAgICAgICAgIC8qIElPIGVycm9yIGhhcHBlbmVkIGJlZm9yZSAqLwo+IC0g
ICAgICAgaWYgKHVubGlrZWx5KGYyZnNfY3BfZXJyb3IoRjJGU19TQihzYikpKSkKPiArICAgICAg
IGlmICh1bmxpa2VseShmMmZzX2NwX2Vycm9yKHNiaSkpKQo+ICAgICAgICAgICAgICAgICByZXR1
cm4gLUVJTzsKPgo+ICAgICAgICAgLyogbXVzdCBiZSBjbGVhbiwgc2luY2Ugc3luY19maWxlc3lz
dGVtKCkgd2FzIGFscmVhZHkgY2FsbGVkICovCj4gLSAgICAgICBpZiAoaXNfc2JpX2ZsYWdfc2V0
KEYyRlNfU0Ioc2IpLCBTQklfSVNfRElSVFkpKQo+ICsgICAgICAgaWYgKGlzX3NiaV9mbGFnX3Nl
dChzYmksIFNCSV9JU19ESVJUWSkpCj4gICAgICAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOwo+
Cj4gKyAgICAgICBzYmktPnVtb3VudF9sb2NrX2hvbGRlciA9IGN1cnJlbnQ7Cj4gKwo+ICAgICAg
ICAgLyogTGV0J3MgZmx1c2ggY2hlY2twb2ludHMgYW5kIHN0b3AgdGhlIHRocmVhZC4gKi8KPiAt
ICAgICAgIGYyZnNfZmx1c2hfY2twdF90aHJlYWQoRjJGU19TQihzYikpOwo+ICsgICAgICAgZjJm
c19mbHVzaF9ja3B0X3RocmVhZChzYmkpOwo+ICsKPiArICAgICAgIHNiaS0+dW1vdW50X2xvY2tf
aG9sZGVyID0gTlVMTDsKPgo+ICAgICAgICAgLyogdG8gYXZvaWQgZGVhZGxvY2sgb24gZjJmc19l
dmljdF9pbm9kZS0+U0JfRlJFRVpFX0ZTICovCj4gLSAgICAgICBzZXRfc2JpX2ZsYWcoRjJGU19T
QihzYiksIFNCSV9JU19GUkVFWklORyk7Cj4gKyAgICAgICBzZXRfc2JpX2ZsYWcoc2JpLCBTQklf
SVNfRlJFRVpJTkcpOwo+ICAgICAgICAgcmV0dXJuIDA7Cj4gIH0KPgo+IEBAIC0yMzMyLDYgKzIz
MzgsOCBAQCBzdGF0aWMgaW50IGYyZnNfcmVtb3VudChzdHJ1Y3Qgc3VwZXJfYmxvY2sgKnNiLCBp
bnQgKmZsYWdzLCBjaGFyICpkYXRhKQo+ICAgICAgICAgb3JnX21vdW50X29wdCA9IHNiaS0+bW91
bnRfb3B0Owo+ICAgICAgICAgb2xkX3NiX2ZsYWdzID0gc2ItPnNfZmxhZ3M7Cj4KPiArICAgICAg
IHNiaS0+dW1vdW50X2xvY2tfaG9sZGVyID0gY3VycmVudDsKPiArCj4gICNpZmRlZiBDT05GSUdf
UVVPVEEKPiAgICAgICAgIG9yZ19tb3VudF9vcHQuc19qcXVvdGFfZm10ID0gRjJGU19PUFRJT04o
c2JpKS5zX2pxdW90YV9mbXQ7Cj4gICAgICAgICBmb3IgKGkgPSAwOyBpIDwgTUFYUVVPVEFTOyBp
KyspIHsKPiBAQCAtMjU1NSw2ICsyNTYzLDggQEAgc3RhdGljIGludCBmMmZzX3JlbW91bnQoc3Ry
dWN0IHN1cGVyX2Jsb2NrICpzYiwgaW50ICpmbGFncywgY2hhciAqZGF0YSkKPgo+ICAgICAgICAg
bGltaXRfcmVzZXJ2ZV9yb290KHNiaSk7Cj4gICAgICAgICAqZmxhZ3MgPSAoKmZsYWdzICYgflNC
X0xBWllUSU1FKSB8IChzYi0+c19mbGFncyAmIFNCX0xBWllUSU1FKTsKPiArCj4gKyAgICAgICBz
YmktPnVtb3VudF9sb2NrX2hvbGRlciA9IE5VTEw7Cj4gICAgICAgICByZXR1cm4gMDsKPiAgcmVz
dG9yZV9jaGVja3BvaW50Ogo+ICAgICAgICAgaWYgKG5lZWRfZW5hYmxlX2NoZWNrcG9pbnQpIHsK
PiBAQCAtMjU5NSw2ICsyNjA1LDggQEAgc3RhdGljIGludCBmMmZzX3JlbW91bnQoc3RydWN0IHN1
cGVyX2Jsb2NrICpzYiwgaW50ICpmbGFncywgY2hhciAqZGF0YSkKPiAgI2VuZGlmCj4gICAgICAg
ICBzYmktPm1vdW50X29wdCA9IG9yZ19tb3VudF9vcHQ7Cj4gICAgICAgICBzYi0+c19mbGFncyA9
IG9sZF9zYl9mbGFnczsKPiArCj4gKyAgICAgICBzYmktPnVtb3VudF9sb2NrX2hvbGRlciA9IE5V
TEw7Cj4gICAgICAgICByZXR1cm4gZXJyOwo+ICB9Cj4KPiBAQCAtMjkxMSw3ICsyOTIzLDcgQEAg
c3RhdGljIGludCBmMmZzX3F1b3RhX3N5bmNfZmlsZShzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmks
IGludCB0eXBlKQo+ICAgICAgICAgcmV0dXJuIHJldDsKPiAgfQo+Cj4gLWludCBmMmZzX3F1b3Rh
X3N5bmMoc3RydWN0IHN1cGVyX2Jsb2NrICpzYiwgaW50IHR5cGUpCj4gK2ludCBmMmZzX2RvX3F1
b3RhX3N5bmMoc3RydWN0IHN1cGVyX2Jsb2NrICpzYiwgaW50IHR5cGUpCj4gIHsKPiAgICAgICAg
IHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSA9IEYyRlNfU0Ioc2IpOwo+ICAgICAgICAgc3RydWN0
IHF1b3RhX2luZm8gKmRxb3B0ID0gc2JfZHFvcHQoc2IpOwo+IEBAIC0yOTU5LDYgKzI5NzEsMTYg
QEAgaW50IGYyZnNfcXVvdGFfc3luYyhzdHJ1Y3Qgc3VwZXJfYmxvY2sgKnNiLCBpbnQgdHlwZSkK
PiAgICAgICAgIHJldHVybiByZXQ7Cj4gIH0KPgo+ICtzdGF0aWMgaW50IGYyZnNfcXVvdGFfc3lu
YyhzdHJ1Y3Qgc3VwZXJfYmxvY2sgKnNiLCBpbnQgdHlwZSkKPiArewo+ICsgICAgICAgaW50IHJl
dDsKPiArCj4gKyAgICAgICBGMkZTX1NCKHNiKS0+dW1vdW50X2xvY2tfaG9sZGVyID0gY3VycmVu
dDsKPiArICAgICAgIHJldCA9IGYyZnNfZG9fcXVvdGFfc3luYyhzYiwgdHlwZSk7Cj4gKyAgICAg
ICBGMkZTX1NCKHNiKS0+dW1vdW50X2xvY2tfaG9sZGVyID0gTlVMTDsKPiArICAgICAgIHJldHVy
biByZXQ7Cj4gK30KPiArCj4gIHN0YXRpYyBpbnQgZjJmc19xdW90YV9vbihzdHJ1Y3Qgc3VwZXJf
YmxvY2sgKnNiLCBpbnQgdHlwZSwgaW50IGZvcm1hdF9pZCwKPiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IHN0cnVjdCBwYXRoICpw
YXRoKQo+ICB7Cj4gQEAgLTI5NzQsMzAgKzI5OTYsMzMgQEAgc3RhdGljIGludCBmMmZzX3F1b3Rh
X29uKHN0cnVjdCBzdXBlcl9ibG9jayAqc2IsIGludCB0eXBlLCBpbnQgZm9ybWF0X2lkLAo+ICAg
ICAgICAgaWYgKHBhdGgtPmRlbnRyeS0+ZF9zYiAhPSBzYikKPiAgICAgICAgICAgICAgICAgcmV0
dXJuIC1FWERFVjsKPgo+IC0gICAgICAgZXJyID0gZjJmc19xdW90YV9zeW5jKHNiLCB0eXBlKTsK
PiArICAgICAgIEYyRlNfU0Ioc2IpLT51bW91bnRfbG9ja19ob2xkZXIgPSBjdXJyZW50Owo+ICsK
PiArICAgICAgIGVyciA9IGYyZnNfZG9fcXVvdGFfc3luYyhzYiwgdHlwZSk7Cj4gICAgICAgICBp
ZiAoZXJyKQo+IC0gICAgICAgICAgICAgICByZXR1cm4gZXJyOwo+ICsgICAgICAgICAgICAgICBn
b3RvIG91dDsKPgo+ICAgICAgICAgaW5vZGUgPSBkX2lub2RlKHBhdGgtPmRlbnRyeSk7Cj4KPiAg
ICAgICAgIGVyciA9IGZpbGVtYXBfZmRhdGF3cml0ZShpbm9kZS0+aV9tYXBwaW5nKTsKPiAgICAg
ICAgIGlmIChlcnIpCj4gLSAgICAgICAgICAgICAgIHJldHVybiBlcnI7Cj4gKyAgICAgICAgICAg
ICAgIGdvdG8gb3V0Owo+Cj4gICAgICAgICBlcnIgPSBmaWxlbWFwX2ZkYXRhd2FpdChpbm9kZS0+
aV9tYXBwaW5nKTsKPiAgICAgICAgIGlmIChlcnIpCj4gLSAgICAgICAgICAgICAgIHJldHVybiBl
cnI7Cj4gKyAgICAgICAgICAgICAgIGdvdG8gb3V0Owo+Cj4gICAgICAgICBlcnIgPSBkcXVvdF9x
dW90YV9vbihzYiwgdHlwZSwgZm9ybWF0X2lkLCBwYXRoKTsKPiAgICAgICAgIGlmIChlcnIpCj4g
LSAgICAgICAgICAgICAgIHJldHVybiBlcnI7Cj4gKyAgICAgICAgICAgICAgIGdvdG8gb3V0Owo+
Cj4gICAgICAgICBpbm9kZV9sb2NrKGlub2RlKTsKPiAgICAgICAgIEYyRlNfSShpbm9kZSktPmlf
ZmxhZ3MgfD0gRjJGU19RVU9UQV9ERUZBVUxUX0ZMOwo+ICAgICAgICAgZjJmc19zZXRfaW5vZGVf
ZmxhZ3MoaW5vZGUpOwo+ICAgICAgICAgaW5vZGVfdW5sb2NrKGlub2RlKTsKPiAgICAgICAgIGYy
ZnNfbWFya19pbm9kZV9kaXJ0eV9zeW5jKGlub2RlLCBmYWxzZSk7Cj4gLQo+ICtvdXQ6Cj4gKyAg
ICAgICBGMkZTX1NCKHNiKS0+dW1vdW50X2xvY2tfaG9sZGVyID0gTlVMTDsKPiAgICAgICAgIHJl
dHVybiAwOwpIaSBDaGFvLApIZXJlIHNob3VsZCByZXR1cm4gZXJyPyBhbmQgaW5pdCBlcnI9MCBp
biB0aGUgYmVnaW5uaW5nPwp0aGFua3PvvIEKPiAgfQo+Cj4gQEAgLTMwMDksNyArMzAzNCw3IEBA
IHN0YXRpYyBpbnQgX19mMmZzX3F1b3RhX29mZihzdHJ1Y3Qgc3VwZXJfYmxvY2sgKnNiLCBpbnQg
dHlwZSkKPiAgICAgICAgIGlmICghaW5vZGUgfHwgIWlncmFiKGlub2RlKSkKPiAgICAgICAgICAg
ICAgICAgcmV0dXJuIGRxdW90X3F1b3RhX29mZihzYiwgdHlwZSk7Cj4KPiAtICAgICAgIGVyciA9
IGYyZnNfcXVvdGFfc3luYyhzYiwgdHlwZSk7Cj4gKyAgICAgICBlcnIgPSBmMmZzX2RvX3F1b3Rh
X3N5bmMoc2IsIHR5cGUpOwo+ICAgICAgICAgaWYgKGVycikKPiAgICAgICAgICAgICAgICAgZ290
byBvdXRfcHV0Owo+Cj4gQEAgLTMwMzIsNiArMzA1Nyw4IEBAIHN0YXRpYyBpbnQgZjJmc19xdW90
YV9vZmYoc3RydWN0IHN1cGVyX2Jsb2NrICpzYiwgaW50IHR5cGUpCj4gICAgICAgICBzdHJ1Y3Qg
ZjJmc19zYl9pbmZvICpzYmkgPSBGMkZTX1NCKHNiKTsKPiAgICAgICAgIGludCBlcnI7Cj4KPiAr
ICAgICAgIEYyRlNfU0Ioc2IpLT51bW91bnRfbG9ja19ob2xkZXIgPSBjdXJyZW50Owo+ICsKPiAg
ICAgICAgIGVyciA9IF9fZjJmc19xdW90YV9vZmYoc2IsIHR5cGUpOwo+Cj4gICAgICAgICAvKgo+
IEBAIC0zMDQxLDYgKzMwNjgsOSBAQCBzdGF0aWMgaW50IGYyZnNfcXVvdGFfb2ZmKHN0cnVjdCBz
dXBlcl9ibG9jayAqc2IsIGludCB0eXBlKQo+ICAgICAgICAgICovCj4gICAgICAgICBpZiAoaXNf
am91cm5hbGxlZF9xdW90YShzYmkpKQo+ICAgICAgICAgICAgICAgICBzZXRfc2JpX2ZsYWcoc2Jp
LCBTQklfUVVPVEFfTkVFRF9SRVBBSVIpOwo+ICsKPiArICAgICAgIEYyRlNfU0Ioc2IpLT51bW91
bnRfbG9ja19ob2xkZXIgPSBOVUxMOwo+ICsKPiAgICAgICAgIHJldHVybiBlcnI7Cj4gIH0KPgo+
IEBAIC00NzE1LDYgKzQ3NDUsNyBAQCBzdGF0aWMgaW50IGYyZnNfZmlsbF9zdXBlcihzdHJ1Y3Qg
c3VwZXJfYmxvY2sgKnNiLCB2b2lkICpkYXRhLCBpbnQgc2lsZW50KQo+ICAgICAgICAgaWYgKGVy
cikKPiAgICAgICAgICAgICAgICAgZ290byBmcmVlX2NvbXByZXNzX2lub2RlOwo+Cj4gKyAgICAg
ICBzYmktPnVtb3VudF9sb2NrX2hvbGRlciA9IGN1cnJlbnQ7Cj4gICNpZmRlZiBDT05GSUdfUVVP
VEEKPiAgICAgICAgIC8qIEVuYWJsZSBxdW90YSB1c2FnZSBkdXJpbmcgbW91bnQgKi8KPiAgICAg
ICAgIGlmIChmMmZzX3NiX2hhc19xdW90YV9pbm8oc2JpKSAmJiAhZjJmc19yZWFkb25seShzYikp
IHsKPiBAQCAtNDg0MSw2ICs0ODcyLDggQEAgc3RhdGljIGludCBmMmZzX2ZpbGxfc3VwZXIoc3Ry
dWN0IHN1cGVyX2Jsb2NrICpzYiwgdm9pZCAqZGF0YSwgaW50IHNpbGVudCkKPiAgICAgICAgIGYy
ZnNfdXBkYXRlX3RpbWUoc2JpLCBDUF9USU1FKTsKPiAgICAgICAgIGYyZnNfdXBkYXRlX3RpbWUo
c2JpLCBSRVFfVElNRSk7Cj4gICAgICAgICBjbGVhcl9zYmlfZmxhZyhzYmksIFNCSV9DUF9ESVNB
QkxFRF9RVUlDSyk7Cj4gKwo+ICsgICAgICAgc2JpLT51bW91bnRfbG9ja19ob2xkZXIgPSBOVUxM
Owo+ICAgICAgICAgcmV0dXJuIDA7Cj4KPiAgc3luY19mcmVlX21ldGE6Cj4gQEAgLTQ5NDUsNiAr
NDk3OCw4IEBAIHN0YXRpYyB2b2lkIGtpbGxfZjJmc19zdXBlcihzdHJ1Y3Qgc3VwZXJfYmxvY2sg
KnNiKQo+ICAgICAgICAgc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpID0gRjJGU19TQihzYik7Cj4K
PiAgICAgICAgIGlmIChzYi0+c19yb290KSB7Cj4gKyAgICAgICAgICAgICAgIHNiaS0+dW1vdW50
X2xvY2tfaG9sZGVyID0gY3VycmVudDsKPiArCj4gICAgICAgICAgICAgICAgIHNldF9zYmlfZmxh
ZyhzYmksIFNCSV9JU19DTE9TRSk7Cj4gICAgICAgICAgICAgICAgIGYyZnNfc3RvcF9nY190aHJl
YWQoc2JpKTsKPiAgICAgICAgICAgICAgICAgZjJmc19zdG9wX2Rpc2NhcmRfdGhyZWFkKHNiaSk7
Cj4gLS0KPiAyLjQ4LjEuNTAyLmc2ZGMyNGRmZGFmLWdvb2cKPgo+Cj4KPiBfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IExpbnV4LWYyZnMtZGV2ZWwgbWFp
bGluZyBsaXN0Cj4gTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKPiBodHRw
czovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVs
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgt
ZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3Jn
ZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgt
ZjJmcy1kZXZlbAo=
