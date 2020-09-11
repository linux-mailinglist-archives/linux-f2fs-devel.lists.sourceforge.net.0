Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E2F042657A0
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 11 Sep 2020 05:41:25 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kGZw9-0002Iu-9O; Fri, 11 Sep 2020 03:41:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daeho43@gmail.com>) id 1kGZw8-0002Ii-0J
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 11 Sep 2020 03:41:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SZnCHt2yNpfVgHu7ustJxbY2YalBqXYYxUYpOpDs+xw=; b=hFdTn2rcXVH/wzs/NcJpH3niCQ
 ART+wi7uOVwGtjlQSBOKmB+GVDE63sPDRYjOfOYPKzNwQ0GhlnGoKNPk1CJL+TUyT4iXscdioV4S0
 oPGiCLOuTi1loi6I8CA8LoHVwY+Fk+XfEKfvXd/ErC/n3yEutjiBL3+s2pHi9ZbHruak=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=SZnCHt2yNpfVgHu7ustJxbY2YalBqXYYxUYpOpDs+xw=; b=Kg3PMm2XG5bimE+l/zeJQPp7+R
 66T9DkJSbpMslkfzpQnBxr6+sOvhwkIYgTzpNWou+A9feNrOquMCJbm0kSwyZbKjXhIGbxCzL49Zz
 ovyu5qgwqBuOlsnA37q1GGIDu274VyCxFuWPxQAcZSjB2TSIhLPNL+r6AMJ15L7l6yMQ=;
Received: from mail-lf1-f66.google.com ([209.85.167.66])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kGZvw-003TG0-8e
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 11 Sep 2020 03:41:19 +0000
Received: by mail-lf1-f66.google.com with SMTP id y11so4745811lfl.5
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 10 Sep 2020 20:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=SZnCHt2yNpfVgHu7ustJxbY2YalBqXYYxUYpOpDs+xw=;
 b=dAi0mTgqDAcmyNZuS7mAwqCcGTrUhMBrhQoTfzlkU9Ul8b02AjCF3MLX+XtKNCqXZb
 r6KbVSEcSVjerAJgXu8tL670wmmi6RPz+PjHe3tFWE1Cv0xhu9DJRh5gAD6w844xoGdU
 WMitYj+3SssAV/WADbanGYlEbLwm7JHZS6Dr+WltyEPMbmmDTfC4zDGscCpJtoAaP7mv
 HfjZLK/lIAoD9z6vvukn5EO0TzGlgRmYUOx9OwdFiCAZlwdYwaO5U73aBDKIcoAPfXWW
 mBoR/Q6BXQZ0oRsmeiT+4zGlbbCSZLBFweForaYN+Jg6TToaybYE76tcSAgvrzQh88ZF
 qF9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=SZnCHt2yNpfVgHu7ustJxbY2YalBqXYYxUYpOpDs+xw=;
 b=JrcwdO8XDxiqBPbRwpTcHS8fKJZQ3XXLDqrDddhqlp/MHvHinyaWYWSEUNb+qBVmQr
 Yyno53u2si+E8vHTrZw7HAas6+fYk+BV+aDXacmlQJYmgePmuI/WAJ+RfyURq/oY8LNF
 FuX0s1E/Wm7Tv6BRI6GHvVpsBQbmlyG/+x2pjUvqJYoayV6+rYWvHwYGRlt//XS/RcR1
 LUDyZvQJGcXeWeXnKyAGSPa97RdhMgXYIL75RqqFDCBYmnyinNluupY3fBry0DBjm2zl
 aF+xwNlyHKpckLU7pp8hjamumV0sZlKNQr7aCvlVhUoxEe73s0kfTZBVTeLaNBZpOI+x
 aWew==
X-Gm-Message-State: AOAM531dRvSzfhDplmxgc7gqWdwHX0cxFYdb+JisJfOe3Oa4/fS7GMgF
 Tu1aItBtoAnkzvYVhi1+WDoQSXNu4btjjet49tI=
X-Google-Smtp-Source: ABdhPJwqb4DMscnQi2Z+Em6otwpewZZ0yVXRE8XDRWKswbL+xtXEN2rBR5AVA/cxQKn9bFD0zYNnHf3SwUdHqMtoNYE=
X-Received: by 2002:a19:5e19:: with SMTP id s25mr5474336lfb.196.1599795661515; 
 Thu, 10 Sep 2020 20:41:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200910052948.2021806-1-daeho43@gmail.com>
 <bb32e47d-ecc1-39d5-7877-38aac7390d60@huawei.com>
In-Reply-To: <bb32e47d-ecc1-39d5-7877-38aac7390d60@huawei.com>
From: Daeho Jeong <daeho43@gmail.com>
Date: Fri, 11 Sep 2020 12:40:50 +0900
Message-ID: <CACOAw_x-mfVFAVBE4p0CgspQuCREA2M28yZSw0yHJzr30k+5gg@mail.gmail.com>
To: Chao Yu <yuchao0@huawei.com>
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (daeho43[at]gmail.com)
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.167.66 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.66 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (daeho43[at]gmail.com)
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1kGZvw-003TG0-8e
Subject: Re: [f2fs-dev] [PATCH v3] f2fs_io: change fibmap to fiemap
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
Cc: Daeho Jeong <daehojeong@google.com>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

SSBkb24ndCB0aGluayBpdCBpcyByZXF1aXJlZCwgc2luY2Ugb25seSBmMmZzX2lvLmMgdXNlcyBm
aWVtYXAgYW5kCmYyZnNfaW8gZG9lc24ndCB1c2UgaW5jbHVkZS9hbmRyb2lkX2NvbmZpZy5oLgoK
MjAyMOuFhCA57JuUIDEx7J28ICjquIgpIOyYpO2bhCAxMjozNiwgQ2hhbyBZdSA8eXVjaGFvMEBo
dWF3ZWkuY29tPuuLmOydtCDsnpHshLE6Cj4KPiBPbiAyMDIwLzkvMTAgMTM6MjksIERhZWhvIEpl
b25nIHdyb3RlOgo+ID4gRnJvbTogRGFlaG8gSmVvbmcgPGRhZWhvamVvbmdAZ29vZ2xlLmNvbT4K
PiA+Cj4gPiBDdXJyZW50bHkgd2Ugc3VwcG9ydCBmaWVtYXAgY29tbWFuZCB1c2luZyBmaWJtYXAu
IEl0J3Mgc2ltcGxlIGFuZAo+ID4gZWFzeSB0byB1c2UsIGJ1dCB3ZSBjYW5ub3QgdXNlIHRoaXMg
Zm9yIGNvbXByZXNzZWQgZmlsZS4gVG8gc3VwcG9ydAo+ID4gbW9yZSBkaWZmZXJlbnQgdHlwZXMg
b2YgZmlsZXMsIHdlIG5lZWQgdG8gY2hhbmdlIHRoaXMgdG8gdXNlIGZpZW1hcC4KPiA+Cj4gPiBT
aWduZWQtb2ZmLWJ5OiBEYWVobyBKZW9uZyA8ZGFlaG9qZW9uZ0Bnb29nbGUuY29tPgo+ID4gLS0t
Cj4gPiBDaGFuZ2VzIGluIHYzOgo+ID4gICAtIENoYW5nZSB0byB1c2UgbGludXgvZmllbWFwLmgg
aGVhZGVyCj4gPiBDaGFuZ2VzIGluIHYyOgo+ID4gICAtIE1vdmUgZGVjbGFyYXRpb24gdG8gaGVh
ZGVyIGZpbGUKPiA+IC0tLQo+ID4gICBjb25maWd1cmUuYWMgICAgICAgICAgICB8ICAxICsKPiA+
ICAgdG9vbHMvZjJmc19pby9mMmZzX2lvLmMgfCA0MSArKysrKysrKysrKysrKysrKysrKystLS0t
LS0tLS0tLS0tLS0tLS0tLQo+ID4gICB0b29scy9mMmZzX2lvL2YyZnNfaW8uaCB8IDEwICsrKysr
KysrKysKPiA+ICAgMyBmaWxlcyBjaGFuZ2VkLCAzMiBpbnNlcnRpb25zKCspLCAyMCBkZWxldGlv
bnMoLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvY29uZmlndXJlLmFjIGIvY29uZmlndXJlLmFjCj4g
PiBpbmRleCBlOWFjZDFhLi5lYjFlNzQ1IDEwMDY0NAo+ID4gLS0tIGEvY29uZmlndXJlLmFjCj4g
PiArKysgYi9jb25maWd1cmUuYWMKPiA+IEBAIC05Myw2ICs5Myw3IEBAIEFDX0NIRUNLX0hFQURF
UlMobTRfZmxhdHRlbihbCj4gPiAgICAgICBsaW51eC9wb3NpeF9hY2wuaAo+ID4gICAgICAgbGlu
dXgvdHlwZXMuaAo+ID4gICAgICAgbGludXgveGF0dHIuaAo+ID4gKyAgICAgbGludXgvZmllbWFw
LmgKPiA+ICAgICAgIG1hY2gvbWFjaF90aW1lLmgKPiA+ICAgICAgIG1udGVudC5oCj4gPiAgICAg
ICBzY3NpL3NnLmgKPiA+IGRpZmYgLS1naXQgYS90b29scy9mMmZzX2lvL2YyZnNfaW8uYyBiL3Rv
b2xzL2YyZnNfaW8vZjJmc19pby5jCj4gPiBpbmRleCBhYmI2NTVhLi41YTJkMDZlIDEwMDY0NAo+
ID4gLS0tIGEvdG9vbHMvZjJmc19pby9mMmZzX2lvLmMKPiA+ICsrKyBiL3Rvb2xzL2YyZnNfaW8v
ZjJmc19pby5jCj4gPiBAQCAtNjMxLDI3ICs2MzEsMTggQEAgc3RhdGljIHZvaWQgZG9fcmFuZHJl
YWQoaW50IGFyZ2MsIGNoYXIgKiphcmd2LCBjb25zdCBzdHJ1Y3QgY21kX2Rlc2MgKmNtZCkKPiA+
ICAgICAgIGV4aXQoMCk7Cj4gPiAgIH0KPiA+Cj4gPiAtc3RydWN0IGZpbGVfZXh0IHsKPiA+IC0g
ICAgIF9fdTMyIGZfcG9zOwo+ID4gLSAgICAgX191MzIgc3RhcnRfYmxrOwo+ID4gLSAgICAgX191
MzIgZW5kX2JsazsKPiA+IC0gICAgIF9fdTMyIGJsa19jb3VudDsKPiA+IC19Owo+ID4gLQo+ID4g
LSNpZm5kZWYgRklCTUFQCj4gPiAtI2RlZmluZSBGSUJNQVAgICAgICAgICAgX0lPKDB4MDAsIDEp
ICAgIC8qIGJtYXAgYWNjZXNzICovCj4gPiAtI2VuZGlmCj4gPiAtCj4gPiAgICNkZWZpbmUgZmll
bWFwX2Rlc2MgImdldCBibG9jayBhZGRyZXNzIGluIGZpbGUiCj4gPiAgICNkZWZpbmUgZmllbWFw
X2hlbHAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gPiAgICJmMmZzX2lvIGZp
ZW1hcCBbb2Zmc2V0IGluIDRrYl0gW2NvdW50XSBbZmlsZV9wYXRoXVxuXG4iXAo+ID4KPiA+ICAg
c3RhdGljIHZvaWQgZG9fZmllbWFwKGludCBhcmdjLCBjaGFyICoqYXJndiwgY29uc3Qgc3RydWN0
IGNtZF9kZXNjICpjbWQpCj4gPiAgIHsKPiA+IC0gICAgIHU2NCBvZmZzZXQ7Cj4gPiAtICAgICB1
MzIgYmxrbnVtOwo+ID4gKyNpZiBkZWZpbmVkKEhBVkVfTElOVVhfRklFTUFQX0gpICYmIGRlZmlu
ZWQoSEFWRV9MSU5VWF9GU19IKQo+ID4gICAgICAgdW5zaWduZWQgY291bnQsIGk7Cj4gPiAgICAg
ICBpbnQgZmQ7Cj4gPiArICAgICBfX3U2NCBwaHlfYWRkcjsKPiA+ICsgICAgIHN0cnVjdCBmaWVt
YXAgKmZtID0geG1hbGxvYyhzaXplb2Yoc3RydWN0IGZpZW1hcCkgKwo+ID4gKyAgICAgICAgICAg
ICAgICAgICAgIHNpemVvZihzdHJ1Y3QgZmllbWFwX2V4dGVudCkpOwo+ID4KPiA+ICAgICAgIGlm
IChhcmdjICE9IDQpIHsKPiA+ICAgICAgICAgICAgICAgZnB1dHMoIkV4Y2VzcyBhcmd1bWVudHNc
blxuIiwgc3RkZXJyKTsKPiA+IEBAIC02NTksMjIgKzY1MCwzMiBAQCBzdGF0aWMgdm9pZCBkb19m
aWVtYXAoaW50IGFyZ2MsIGNoYXIgKiphcmd2LCBjb25zdCBzdHJ1Y3QgY21kX2Rlc2MgKmNtZCkK
PiA+ICAgICAgICAgICAgICAgZXhpdCgxKTsKPiA+ICAgICAgIH0KPiA+Cj4gPiAtICAgICBvZmZz
ZXQgPSBhdG9pKGFyZ3ZbMV0pOwo+ID4gKyAgICAgZm0tPmZtX3N0YXJ0ID0gYXRvaShhcmd2WzFd
KSAqIEYyRlNfQkxLU0laRTsKPiA+ICsgICAgIGZtLT5mbV9sZW5ndGggPSBGMkZTX0JMS1NJWkU7
Cj4gPiArICAgICBmbS0+Zm1fZXh0ZW50X2NvdW50ID0gMTsKPiA+ICAgICAgIGNvdW50ID0gYXRv
aShhcmd2WzJdKTsKPiA+Cj4gPiAgICAgICBmZCA9IHhvcGVuKGFyZ3ZbM10sIE9fUkRPTkxZIHwg
T19MQVJHRUZJTEUsIDApOwo+ID4KPiA+IC0gICAgIHByaW50ZigiRmllbWFwOiBvZmZzZXQgPSAl
MDgiUFJJeDY0IiBsZW4gPSAlZFxuIiwgb2Zmc2V0LCBjb3VudCk7Cj4gPiArICAgICBwcmludGYo
IkZpZW1hcDogb2Zmc2V0ID0gJTA4IlBSSXg2NCIgbGVuID0gJWRcbiIsCj4gPiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGZtLT5mbV9zdGFydCAvIEYyRlNfQkxLU0laRSwg
Y291bnQpOwo+ID4gICAgICAgZm9yIChpID0gMDsgaSA8IGNvdW50OyBpKyspIHsKPiA+IC0gICAg
ICAgICAgICAgYmxrbnVtID0gb2Zmc2V0ICsgaTsKPiA+IC0KPiA+IC0gICAgICAgICAgICAgaWYg
KGlvY3RsKGZkLCBGSUJNQVAsICZibGtudW0pIDwgMCkKPiA+IC0gICAgICAgICAgICAgICAgICAg
ICBkaWVfZXJybm8oIkZJQk1BUCBmYWlsZWQiKTsKPiA+ICsgICAgICAgICAgICAgaWYgKGlvY3Rs
KGZkLCBGU19JT0NfRklFTUFQLCBmbSkgPCAwKQo+ID4gKyAgICAgICAgICAgICAgICAgICAgIGRp
ZV9lcnJubygiRklFTUFQIGZhaWxlZCIpOwo+ID4KPiA+IC0gICAgICAgICAgICAgcHJpbnRmKCIl
dSAiLCBibGtudW0pOwo+ID4gKyAgICAgICAgICAgICBwaHlfYWRkciA9IGZtLT5mbV9leHRlbnRz
WzBdLmZlX3BoeXNpY2FsIC8gRjJGU19CTEtTSVpFOwo+ID4gKyAgICAgICAgICAgICBpZiAocGh5
X2FkZHIgPT0gTkVXX0FERFIpCj4gPiArICAgICAgICAgICAgICAgICAgICAgcHJpbnRmKCJORVdf
QUREUiAiKTsKPiA+ICsgICAgICAgICAgICAgZWxzZQo+ID4gKyAgICAgICAgICAgICAgICAgICAg
IHByaW50ZigiJWxsdSAiLCBwaHlfYWRkcik7Cj4gPiArICAgICAgICAgICAgIGZtLT5mbV9zdGFy
dCArPSBGMkZTX0JMS1NJWkU7Cj4gPiAgICAgICB9Cj4gPiAgICAgICBwcmludGYoIlxuIik7Cj4g
PiArICAgICBmcmVlKGZtKTsKPiA+ICAgICAgIGV4aXQoMCk7Cj4gPiArI2Vsc2UKPiA+ICsgICAg
IGRpZSgiTm90IHN1cHBvcnQgZm9yIHRoaXMgcGxhdGZvcm0iKTsKPiA+ICsjZW5kaWYKPiA+ICAg
fQo+ID4KPiA+ICAgI2RlZmluZSBnY191cmdlbnRfZGVzYyAic3RhcnQvZW5kL3J1biBnY191cmdl
bnQgZm9yIGdpdmVuIHRpbWUgcGVyaW9kIgo+ID4gZGlmZiAtLWdpdCBhL3Rvb2xzL2YyZnNfaW8v
ZjJmc19pby5oIGIvdG9vbHMvZjJmc19pby9mMmZzX2lvLmgKPiA+IGluZGV4IGJkMTlmZjkuLjA1
ZDRjZmUgMTAwNjQ0Cj4gPiAtLS0gYS90b29scy9mMmZzX2lvL2YyZnNfaW8uaAo+ID4gKysrIGIv
dG9vbHMvZjJmc19pby9mMmZzX2lvLmgKPiA+IEBAIC0xMCw2ICsxMCwxMyBAQAo+ID4gICAjaWZk
ZWYgSEFWRV9MSU5VWF9UWVBFU19ICj4gPiAgICNpbmNsdWRlIDxsaW51eC90eXBlcy5oPgo+ID4g
ICAjZW5kaWYKPiA+ICsjaWZkZWYgSEFWRV9MSU5VWF9GSUVNQVBfSAo+Cj4gU2hvdWxkIGFkZCB0
aGlzIEhBVkVfTElOVVhfRklFTUFQX0ggbWFjcm8gaW50byBpbmNsdWRlL2FuZHJvaWRfY29uZmln
Lmg/Cj4KPiA+ICsjaW5jbHVkZSA8bGludXgvZmllbWFwLmg+Cj4gPiArI2VuZGlmCj4gPiArI2lm
ZGVmIEhBVkVfTElOVVhfRlNfSAo+ID4gKyNpbmNsdWRlIDxsaW51eC9mcy5oPgo+ID4gKyNlbmRp
Zgo+ID4gKwo+ID4gICAjaW5jbHVkZSA8c3lzL3R5cGVzLmg+Cj4gPgo+ID4gICAjaWZkZWYgVU5V
U0VECj4gPiBAQCAtMzgsNiArNDUsOSBAQCB0eXBlZGVmIHUxNiBfX2JlMTY7Cj4gPiAgIHR5cGVk
ZWYgdTMyIF9fYmUzMjsKPiA+ICAgI2VuZGlmCj4gPgo+ID4gKyNkZWZpbmUgRjJGU19CTEtTSVpF
IDQwOTYKPiA+ICsjZGVmaW5lIE5FV19BRERSICAgICAweEZGRkZGRkZGCj4gPiArCj4gPiAgICNp
Zm5kZWYgRlNfSU9DX0dFVEZMQUdTCj4gPiAgICNkZWZpbmUgRlNfSU9DX0dFVEZMQUdTICAgICAg
ICAgICAgICAgICAgICAgX0lPUignZicsIDEsIGxvbmcpCj4gPiAgICNlbmRpZgo+ID4KCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRl
dmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApo
dHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRl
dmVsCg==
