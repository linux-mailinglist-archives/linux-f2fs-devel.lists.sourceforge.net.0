Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CCE2430106
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 16 Oct 2021 10:01:48 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mbedR-0004EB-5d; Sat, 16 Oct 2021 08:01:41 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <fengnanchang@gmail.com>) id 1mbedD-0004Cd-8q
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 16 Oct 2021 08:01:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=E63oA6ykeWfTsRmCRTGAG3GBc4joRAfUGsyC/U33MUo=; b=Tu0P2ZgnUrJbfV/HH/YgPlYFX3
 wsUDL+dC82iPuvOIik/vfrOhBzpx0wtb3Ufs/WS8gyJzzh4H8dSRUVtraR5XT8Zw/N607x6zu/FYr
 MKUEbjolUDsBvz14qwq/UYnpody4KBMoc1uHB5ZRXtxxgiFxJmOWxs4IXVIAsMcOtu7o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=E63oA6ykeWfTsRmCRTGAG3GBc4joRAfUGsyC/U33MUo=; b=U/4tLQtFyXA9CEmmyiUyGxbQ0p
 dJZuwIwl9B6BexNbHy2wAs7ruGO8Q8ssPSpTuB8Cc5FfI8Xks/TW2OO0Au9TrK3rE1qPxI2w0OM/h
 sUrVTt27xhb0/ECxLTHMD7u+RZ1oll7ALPjrnJQoOuo8ZwRt0V42sec+2N3ad1wlZZJ0=;
Received: from mail-ua1-f41.google.com ([209.85.222.41])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1mbed8-00GgT8-QX
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 16 Oct 2021 08:01:27 +0000
Received: by mail-ua1-f41.google.com with SMTP id q13so421990uaq.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 16 Oct 2021 01:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=E63oA6ykeWfTsRmCRTGAG3GBc4joRAfUGsyC/U33MUo=;
 b=IxKsiWKF8JRCpG7NSFPJPazDPBUrAtySLCx0wRvS1QwAPOc+XYJ5K+cdZNOAu9tqz6
 XhkQryK81VwWZVtBr68ztjCeDz0oZkYuhiGrQLuigrSFdarIdPqcGQ99qRGmWleMLHig
 sNqxMOhMPdqYG6GJWhsJixBFQG2ar9UbVywyprpCYt5zhCd0T7smL7buklrERueWJbav
 HjwPA9FLBsra9LWJF8MpiSmTxeRGR3uFLReZITrj55bNyoQcTdn6iV/AjuRTqXdG819F
 jeNLZqSg5yZIqiFPck+KVd5iDFnbnkOvJDFPyqx1OUyZG8PPJicPjnPerpsN8MBZypga
 6ZTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=E63oA6ykeWfTsRmCRTGAG3GBc4joRAfUGsyC/U33MUo=;
 b=FObsgxWxFNR6gbYPkegdtYRaqtTHO9xndueukR/syOYxav+GnJtrySHW6cTebAjPQQ
 /+FX9y1Q+QPMMZwrIFS5kknpC4zJUBTBsqQrwpPzm3LoXW0btKkD3gznPPC06/qhKJuX
 yolIrGCa5zvpX/09gJzc+ICfuA8inooNEuzoyV8gH7clicKf01qzgEX9rQ9Y/S67zEOW
 ntUjTE2Ne8kGfQlCs4VTroBUBHv9Ws0iUz1QODYzLJXvxrxXHwfz6A4hMqtpBieZHt1N
 Es6YuxCawfjd6Gli90IbyURDGr1hXv5VVJg1eaP1RB+8ErucasmyUYVeOo5FZneEOxok
 rAKg==
X-Gm-Message-State: AOAM530gVUJubLhT31e8Po+8/ooaeh0liQ+j3lcUXxwCGDKuwyytGJMB
 1rAgnuXfPP+G7kDAiuEv3LabjLCLfbVjKPMffyLnwyAgRd31qFUZ
X-Google-Smtp-Source: ABdhPJyfiYXd7tfDztZKlrOXbZXF8L8Y7XzNO4NwvbgCHm5k3eBaOu3on2G+zO5iOf3O376YrCYr8MeuK2Q1b4aiu4c=
X-Received: by 2002:a67:df16:: with SMTP id s22mr18562921vsk.47.1634371276895; 
 Sat, 16 Oct 2021 01:01:16 -0700 (PDT)
MIME-Version: 1.0
References: <20211009112744.33698-1-changfengnan@vivo.com>
 <20211009112744.33698-2-changfengnan@vivo.com>
 <66a243ca-53ed-cb8b-064b-5f0d3c954579@kernel.org>
In-Reply-To: <66a243ca-53ed-cb8b-064b-5f0d3c954579@kernel.org>
From: fengnan chang <fengnanchang@gmail.com>
Date: Sat, 16 Oct 2021 16:01:05 +0800
Message-ID: <CALWNXx-cHN3TduduXP2cNmVPR0V5J0Ea8RQ5fcw91Q3pmFvUxg@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Chao Yu 于2021年10月13日周三 下午11:19写道： >
   > On 2021/10/9 19:27, Fengnan Chang wrote: > > For now, overwrite file with
    direct io use inplace policy, but > > not counted, fix it. And u [...] 
 
 Content analysis details:   (-0.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [fengnanchang[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.222.41 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.222.41 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
X-Headers-End: 1mbed8-00GgT8-QX
Subject: Re: [f2fs-dev] [PATCH v5 2/2] f2fs: fix missing inplace count in
 overwrite with direct io
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, Fengnan Chang <changfengnan@vivo.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Q2hhbyBZdSA8Y2hhb0BrZXJuZWwub3JnPiDkuo4yMDIx5bm0MTDmnIgxM+aXpeWRqOS4iSDkuIvl
jYgxMToxOeWGmemBk++8mgo+Cj4gT24gMjAyMS8xMC85IDE5OjI3LCBGZW5nbmFuIENoYW5nIHdy
b3RlOgo+ID4gRm9yIG5vdywgb3ZlcndyaXRlIGZpbGUgd2l0aCBkaXJlY3QgaW8gdXNlIGlucGxh
Y2UgcG9saWN5LCBidXQKPiA+IG5vdCBjb3VudGVkLCBmaXggaXQuIEFuZCB1c2Ugc3RhdF9hZGRf
aW5wbGFjZV9ibG9ja3Moc2JpLCAxLCApCj4gPiBpbnN0ZWFkIG9mIHN0YXRfaW5jX2lucGxhY2Vf
YmxvY2tzKHNiLCApLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEZlbmduYW4gQ2hhbmcgPGNoYW5n
ZmVuZ25hbkB2aXZvLmNvbT4KPiA+IC0tLQo+ID4gICBmcy9mMmZzL2RhdGEuYyAgICB8IDQgKysr
LQo+ID4gICBmcy9mMmZzL2YyZnMuaCAgICB8IDggKysrKy0tLS0KPiA+ICAgZnMvZjJmcy9zZWdt
ZW50LmMgfCAyICstCj4gPiAgIDMgZmlsZXMgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCA2IGRl
bGV0aW9ucygtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9mcy9mMmZzL2RhdGEuYyBiL2ZzL2YyZnMv
ZGF0YS5jCj4gPiBpbmRleCBjMTQ5MGI5YTEzNDUuLjc3OThmNzIzNjM3NiAxMDA2NDQKPiA+IC0t
LSBhL2ZzL2YyZnMvZGF0YS5jCj4gPiArKysgYi9mcy9mMmZzL2RhdGEuYwo+ID4gQEAgLTE1NTMs
NyArMTU1Myw5IEBAIGludCBmMmZzX21hcF9ibG9ja3Moc3RydWN0IGlub2RlICppbm9kZSwgc3Ry
dWN0IGYyZnNfbWFwX2Jsb2NrcyAqbWFwLAo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgZ290byBzeW5jX291dDsKPiA+ICAgICAgICAgICAgICAgICAgICAgICBibGthZGRyID0gZG4u
ZGF0YV9ibGthZGRyOwo+ID4gICAgICAgICAgICAgICAgICAgICAgIHNldF9pbm9kZV9mbGFnKGlu
b2RlLCBGSV9BUFBFTkRfV1JJVEUpOwo+ID4gLSAgICAgICAgICAgICB9Cj4gPiArICAgICAgICAg
ICAgIH0gZWxzZSBpZiAoIWYyZnNfbGZzX21vZGUoc2JpKSAmJiBmbGFnID09IEYyRlNfR0VUX0JM
T0NLX1BSRV9ESU8gJiYKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG1hcC0+bV9t
YXlfY3JlYXRlICYmIGNyZWF0ZSkKPiA+ICsgICAgICAgICAgICAgICAgICAgICBzdGF0X2FkZF9p
bnBsYWNlX2Jsb2NrcyhzYmksIDEsIHRydWUpOwo+Cj4gV2hhdCBhYm91dCB0aGlzIGNhc2U/Cj4K
PiAtIGYyZnNfcHJlYWxsb2NhdGVfYmxvY2tzCj4gICAtIGYyZnNfbWFwX2Jsb2Nrcwo+ICAgIC0g
c3RhdF9hZGRfaW5wbGFjZV9ibG9ja3MKPiAgICBtYXAubV9sZW4gPiAwICYmIGVyciA9PSAtRU5P
U1BDCj4gICAgZXJyID0gMDsKPiAtIF9fZ2VuZXJpY19maWxlX3dyaXRlX2l0ZXIKPiAgIC0gZ2Vu
ZXJpY19maWxlX2RpcmVjdF93cml0ZQo+ICAgIC0gZjJmc19kaXJlY3RfSU8KPiAgICAgLSBnZXRf
ZGF0YV9ibG9ja19kaW9fd3JpdGUKPiAgICAgIC0gX19hbGxvY2F0ZV9kYXRhX2Jsb2NrCj4gICAg
ICAgLSBzdGF0X2luY19ibG9ja19jb3VudAo+Cj4gRElPIGJsb2NrcyB3aWxsIGJlIGFjY291bnRl
ZCBpbnRvIGRpZmZlcmVudCB0eXBlPyBJSVVDLgpZZXMsIGl0IHdpbGwgYmUgYWNjb3VudGVkIGlu
dG8gZGlmZmVyZW50IHR5cGUsICBJUFUgYW5kIExGUywgYnV0IGl0CndpbGwgbm90IGFjY291bnRl
ZCBpbnRvIGJvdGggaW4gc2FtZSB0aW1lIGZvciBvbmUgYmxvY2suCgpyb290QGt2bS14ZnN0ZXN0
czovbW50IyBjYXQgL3N5cy9rZXJuZWwvZGVidWcvZjJmcy9zdGF0dXMgfGdyZXAgU1NSIC1DIDIK
ICAgICAgICAgICBidWZmZXIgICAgIGRpcmVjdCAgIHNlZ21lbnRzCklQVTogICAgICAgICAgIDE2
ICAgICAgICAgMzIgICAgICAgIE4vQQpTU1I6ICAgICAgICAgICAgMCAgICAgICAgICAwICAgICAg
ICAgIDAKTEZTOiAgICAgICAgICAgMzggICAgICAgICA0OCAgICAgICAgICAwCnJvb3RAa3ZtLXhm
c3Rlc3RzOi9tbnQjIGRkIGlmPS9kZXYvemVybyBvZj0uLzEgYnM9MzJLIGNvdW50PTEgb2ZsYWc9
ZGlyZWN0CnJvb3RAa3ZtLXhmc3Rlc3RzOi9tbnQjIGNhdCAvc3lzL2tlcm5lbC9kZWJ1Zy9mMmZz
L3N0YXR1cyB8Z3JlcCBTU1IgLUMgMgogICAgICAgICAgIGJ1ZmZlciAgICAgZGlyZWN0ICAgc2Vn
bWVudHMKSVBVOiAgICAgICAgICAgMTYgICAgICAgICAzMiAgICAgICAgTi9BClNTUjogICAgICAg
ICAgICAwICAgICAgICAgIDAgICAgICAgICAgMApMRlM6ICAgICAgICAgICAzOCAgICAgICAgIDU2
ICAgICAgICAgIDAKCnJvb3RAa3ZtLXhmc3Rlc3RzOi9tbnQjIGRkIGlmPS9kZXYvemVybyBvZj0u
LzEgYnM9MzJLIGNvdW50PTEKb2ZsYWc9ZGlyZWN0IGNvbnY9bm90cnVuYwpyb290QGt2bS14ZnN0
ZXN0czovbW50IyBjYXQgL3N5cy9rZXJuZWwvZGVidWcvZjJmcy9zdGF0dXMgfGdyZXAgU1NSIC1D
IDIKICAgICAgICAgICBidWZmZXIgICAgIGRpcmVjdCAgIHNlZ21lbnRzCklQVTogICAgICAgICAg
IDE2ICAgICAgICAgNDAgICAgICAgIE4vQQpTU1I6ICAgICAgICAgICAgMCAgICAgICAgICAwICAg
ICAgICAgIDAKTEZTOiAgICAgICAgICAgMzggICAgICAgICA1NiAgICAgICAgICAwCgpyb290QGt2
bS14ZnN0ZXN0czovbW50IyBkZCBpZj0vZGV2L3plcm8gb2Y9Li8xIGJzPTMySyBjb3VudD0yCm9m
bGFnPWRpcmVjdCBjb252PW5vdHJ1bmMKcm9vdEBrdm0teGZzdGVzdHM6L21udCMgY2F0IC9zeXMv
a2VybmVsL2RlYnVnL2YyZnMvc3RhdHVzIHxncmVwIFNTUiAtQyAyCiAgICAgICAgICAgYnVmZmVy
ICAgICBkaXJlY3QgICBzZWdtZW50cwpJUFU6ICAgICAgICAgICAxNiAgICAgICAgIDQ4ICAgICAg
ICBOL0EKU1NSOiAgICAgICAgICAgIDAgICAgICAgICAgMCAgICAgICAgICAwCkxGUzogICAgICAg
ICAgIDQxICAgICAgICAgNjQgICAgICAgICAgMAoKCj4KPiA+ICAgICAgIH0gZWxzZSB7Cj4gPiAg
ICAgICAgICAgICAgIGlmIChjcmVhdGUpIHsKPiA+ICAgICAgICAgICAgICAgICAgICAgICBpZiAo
dW5saWtlbHkoZjJmc19jcF9lcnJvcihzYmkpKSkgewo+ID4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMv
ZjJmcy5oIGIvZnMvZjJmcy9mMmZzLmgKPiA+IGluZGV4IGJmMmU3M2U0NjMwNC4uYTdkYTgzNmNh
NjRmIDEwMDY0NAo+ID4gLS0tIGEvZnMvZjJmcy9mMmZzLmgKPiA+ICsrKyBiL2ZzL2YyZnMvZjJm
cy5oCj4gPiBAQCAtMzc4NSwxMiArMzc4NSwxMiBAQCBzdGF0aWMgaW5saW5lIHN0cnVjdCBmMmZz
X3N0YXRfaW5mbyAqRjJGU19TVEFUKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSkKPiA+ICAgICAg
ICAgICAgICAgZWxzZSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIFwKPiA+ICAgICAgICAgICAgICAgICAgICAgICAoKHNiaSktPmJsb2Nr
X2NvdW50WzFdWyhjdXJzZWcpLT5hbGxvY190eXBlXSsrKTsgICAgICAgIFwKPiA+ICAgICAgIH0g
d2hpbGUgKDApCj4gPiAtI2RlZmluZSBzdGF0X2luY19pbnBsYWNlX2Jsb2NrcyhzYmksIGRpcmVj
dF9pbykgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiA+ICsjZGVmaW5l
IHN0YXRfYWRkX2lucGxhY2VfYmxvY2tzKHNiaSwgY291bnQsIGRpcmVjdF9pbykgICAgICAgICAg
ICAgICAgICAgICAgIFwKPiA+ICAgICAgIGRvIHsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gPiAgICAgICAgICAgICAgIGlmIChk
aXJlY3RfaW8pICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ID4g
LSAgICAgICAgICAgICAgICAgICAgIChhdG9taWNfaW5jKCYoc2JpKS0+aW5wbGFjZV9jb3VudFsw
XSkpOyAgICAgICAgIFwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAoYXRvbWljX2FkZChjb3Vu
dCwgJihzYmkpLT5pbnBsYWNlX2NvdW50WzBdKSk7ICBcCj4gPiAgICAgICAgICAgICAgIGVsc2Ug
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBcCj4gPiAtICAgICAgICAgICAgICAgICAgICAgKGF0b21pY19pbmMoJihzYmkpLT5pbnBsYWNl
X2NvdW50WzFdKSk7ICAgICAgICAgXAo+ID4gKyAgICAgICAgICAgICAgICAgICAgIChhdG9taWNf
YWRkKGNvdW50LCAmKHNiaSktPmlucGxhY2VfY291bnRbMV0pKTsgIFwKPgo+IElmIGNvdW50IGFs
d2F5cyBiZSBvbmUsIHdlIGNhbiBqdXN0IGtlZXAgdG8gdXNlIGF0b21pY19pbmMoKSBoZXJlPwo+
Ckkgc3VnZ2VzdCBub3QsIHdlIG1heSB1c2UgdGhpcyBpbiBsYXRlciBwYXRjaCwgbm90IHJlYWR5
IGZvciBub3cuCgo+IFRoYW5rcywKPgo+ID4gICAgICAgfSB3aGlsZSAoMCkKPiA+ICAgI2RlZmlu
ZSBzdGF0X3VwZGF0ZV9tYXhfYXRvbWljX3dyaXRlKGlub2RlKSAgICAgICAgICAgICAgICAgICAg
ICAgICBcCj4gPiAgICAgICBkbyB7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgXAo+ID4gQEAgLTM4NzcsNyArMzg3Nyw3IEBAIHZvaWQg
ZjJmc191cGRhdGVfc2l0X2luZm8oc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpKTsKPiA+ICAgI2Rl
ZmluZSBzdGF0X2luY19tZXRhX2NvdW50KHNiaSwgYmxrYWRkcikgICAgICAgICAgIGRvIHsgfSB3
aGlsZSAoMCkKPiA+ICAgI2RlZmluZSBzdGF0X2luY19zZWdfdHlwZShzYmksIGN1cnNlZykgICAg
ICAgICAgICAgICAgICAgICAgZG8geyB9IHdoaWxlICgwKQo+ID4gICAjZGVmaW5lIHN0YXRfaW5j
X2Jsb2NrX2NvdW50KHNiaSwgY3Vyc2VnLCBkaXJlY3RfaW8pICAgICAgICBkbyB7IH0gd2hpbGUg
KDApCj4gPiAtI2RlZmluZSBzdGF0X2luY19pbnBsYWNlX2Jsb2NrcyhzYmksIGRpcmVjdF9pbykg
ICAgICAgICAgICAgIGRvIHsgfSB3aGlsZSAoMCkKPiA+ICsjZGVmaW5lIHN0YXRfYWRkX2lucGxh
Y2VfYmxvY2tzKHNiaSwgY291bnQsIGRpcmVjdF9pbykgICAgICAgZG8geyB9IHdoaWxlICgwKQo+
ID4gICAjZGVmaW5lIHN0YXRfaW5jX3NlZ19jb3VudChzYmksIHR5cGUsIGdjX3R5cGUpICAgICAg
ICAgICAgICBkbyB7IH0gd2hpbGUgKDApCj4gPiAgICNkZWZpbmUgc3RhdF9pbmNfdG90X2Jsa19j
b3VudChzaSwgYmxrcykgICAgICAgICAgICBkbyB7IH0gd2hpbGUgKDApCj4gPiAgICNkZWZpbmUg
c3RhdF9pbmNfZGF0YV9ibGtfY291bnQoc2JpLCBibGtzLCBnY190eXBlKSBkbyB7IH0gd2hpbGUg
KDApCj4gPiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9zZWdtZW50LmMgYi9mcy9mMmZzL3NlZ21lbnQu
Ywo+ID4gaW5kZXggZGVkNzQ0ZTg4MGQwLi5jNTQyYzRiNjg3Y2EgMTAwNjQ0Cj4gPiAtLS0gYS9m
cy9mMmZzL3NlZ21lbnQuYwo+ID4gKysrIGIvZnMvZjJmcy9zZWdtZW50LmMKPiA+IEBAIC0zNjEx
LDcgKzM2MTEsNyBAQCBpbnQgZjJmc19pbnBsYWNlX3dyaXRlX2RhdGEoc3RydWN0IGYyZnNfaW9f
aW5mbyAqZmlvKQo+ID4gICAgICAgICAgICAgICBnb3RvIGRyb3BfYmlvOwo+ID4gICAgICAgfQo+
ID4KPiA+IC0gICAgIHN0YXRfaW5jX2lucGxhY2VfYmxvY2tzKGZpby0+c2JpLCBmYWxzZSk7Cj4g
PiArICAgICBzdGF0X2FkZF9pbnBsYWNlX2Jsb2NrcyhzYmksIDEsIGZhbHNlKTsKPiA+Cj4gPiAg
ICAgICBpZiAoZmlvLT5iaW8gJiYgIShTTV9JKHNiaSktPmlwdV9wb2xpY3kgJiAoMSA8PCBGMkZT
X0lQVV9OT0NBQ0hFKSkpCj4gPiAgICAgICAgICAgICAgIGVyciA9IGYyZnNfbWVyZ2VfcGFnZV9i
aW8oZmlvKTsKPiA+Cj4KPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCj4gTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKPiBMaW51eC1mMmZzLWRl
dmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldAo+IGh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0
L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApM
aW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJj
ZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
