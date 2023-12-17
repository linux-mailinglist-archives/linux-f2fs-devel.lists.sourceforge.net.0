Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C49FF815E54
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 17 Dec 2023 10:32:48 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rEnVo-0003Dm-Hi;
	Sun, 17 Dec 2023 09:32:41 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <amir73il@gmail.com>) id 1rEnVn-0003DY-J6;
 Sun, 17 Dec 2023 09:32:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=AYgbvFbc651hSucNzc13NR4vR18Ijwdd2sBGbj5gCiE=; b=iblChlvETsl6lCrX+zV8jJLRTj
 446btIu9tjh7i3sM9SRr6cNRvV5qrC4Y+wnaB6F27euNBN2b2FE1QgbPsn5GoyL84jV0WB8jESxhA
 F5l5Cp1uX0nIo58aZXwL3AgKXLp5D+kxq9+hlFFi8JKJj9tGyGdTM69+a1nJrbG/7pNM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=AYgbvFbc651hSucNzc13NR4vR18Ijwdd2sBGbj5gCiE=; b=m8ZKDKMAdKmQCR9EIojW+YXj2i
 LknNhpw+11IqUAsuvqIpnIX60SPh5hnov7cO7zG1UXx+xUtUT0fst+MCkk8ceroje/+e0A5GxKNrp
 4hwOQbKUPUmiNJLQ3Ku5S4zs8jJS8SJ91rACxw9Tn409xOAChT03vfRe482Dy7+kD8VM=;
Received: from mail-qk1-f170.google.com ([209.85.222.170])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rEnVm-0007xG-54; Sun, 17 Dec 2023 09:32:40 +0000
Received: by mail-qk1-f170.google.com with SMTP id
 af79cd13be357-77f43042268so252621985a.1; 
 Sun, 17 Dec 2023 01:32:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702805547; x=1703410347; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AYgbvFbc651hSucNzc13NR4vR18Ijwdd2sBGbj5gCiE=;
 b=mLr6f/HqsDFaft8wkmlZyxTjvdkx2US/aTJjLMun9R49s49rEKfGGgVMD5iWDxaFU1
 XKHz3+IPq/RMfT/eF9xnqK7CRcPF++Xvh9a93H25B0nEt+HojvblhnNxoOkvlnV9L86T
 4C87aJX8RzRFERbOhRlOdFx2xw3yLYz/uczXBxR/avBRgykeURxUTpWwqNmR/SDjRxt0
 0sLpRTOvVdD5Frw5ZYAhw8bX3IPKMk9+TW9lzgTgnxLo8GJiWIooZmLKHAj9y3OKaU/+
 3ZS6bh4qLbJ75iKKC72zYtHo0nh0YIdL3MFCxBH/GPpU4D52scfMzP7ymlbcj7f+JTdE
 +L5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702805547; x=1703410347;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AYgbvFbc651hSucNzc13NR4vR18Ijwdd2sBGbj5gCiE=;
 b=LK2J0Y7RYHEAHgceSHTlWrYjn2Va5RDJS7UkqjLpdFEhnhj/X6AooCiRPXhLzeFLzd
 ywkIakrm1dXRDj1biU82l7DOHzVvCRrnUK3Uia4bGG0XhryMPWwIQoC1EvQiTo9Xgblq
 RiHi3xqlz+OlEpyViW8DXHbZ+b/NG2soUfg85+78NSNgRarHEcnyyJSYR4ioMsjWcF7b
 NHWNQAaMYNLIDOEeMzIz94ib+7amvcn6fbzUUEQKXtd8NqxBRA+oEUeRrLlwi5l3yoab
 M7fHb2y2xowCaycil4XQL2rbml+8DW1F5A+uEUx7l3GDBTr7moaNW/E1D/TDKuYEwy7Y
 ui4A==
X-Gm-Message-State: AOJu0YyUJMtmciWjCOt5RPxzu6qkXMDg7+YfPnwv94GTxYfCxOfeAb7V
 lOYdLJDwri9kiBwWT6v6TptXCMBULeGrpQ4uDic=
X-Google-Smtp-Source: AGHT+IH3PaGiNcaIanZwKUHmvWmiaD6dbQ+VGgW1jriDoXnyIC8pX42JlN6X1eEh0YqPzW10W78T8JV0bY1+1ymerFY=
X-Received: by 2002:a05:620a:4950:b0:77f:89e:986d with SMTP id
 vz16-20020a05620a495000b0077f089e986dmr18486113qkn.78.1702805547194; Sun, 17
 Dec 2023 01:32:27 -0800 (PST)
MIME-Version: 1.0
References: <0000000000003362ba060ca8beac@google.com>
 <tencent_4E2FCFC90D97A5910DFA926DDD945D9B1907@qq.com>
In-Reply-To: <tencent_4E2FCFC90D97A5910DFA926DDD945D9B1907@qq.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Sun, 17 Dec 2023 11:32:16 +0200
Message-ID: <CAOQ4uxi+4-jyNY6jzNt1wG5xcYSZiSfU0AtCWtF71PSW160zRw@mail.gmail.com>
To: Edward Adam Davis <eadavis@qq.com>, viro@zeniv.linux.org.uk
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Hi Edward, Thanks for the quick fix, but it is incorrect.
   On Sun, Dec 17, 2023 at 10:11 AM Edward Adam Davis wrote: > > workdir and
    destdir could be the same when copying up to indexdir. 
 
 Content analysis details:   (-0.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [amir73il[at]gmail.com]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.222.170 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.222.170 listed in list.dnswl.org]
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rEnVm-0007xG-54
Subject: Re: [f2fs-dev] [PATCH] ovl: fix BUG: Dentry still in use in unmount
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
Cc: squashfs-devel@lists.sourceforge.net, reiserfs-devel@vger.kernel.org,
 Miklos Szeredi <miklos@szeredi.hu>,
 syzbot+8608bb4553edb8c78f41@syzkaller.appspotmail.com,
 syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, terrelln@fb.com,
 phillip@squashfs.org.uk, linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org,
 overlayfs <linux-unionfs@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

SGkgRWR3YXJkLAoKVGhhbmtzIGZvciB0aGUgcXVpY2sgZml4LCBidXQgaXQgaXMgaW5jb3JyZWN0
LgoKT24gU3VuLCBEZWMgMTcsIDIwMjMgYXQgMTA6MTHigK9BTSBFZHdhcmQgQWRhbSBEYXZpcyA8
ZWFkYXZpc0BxcS5jb20+IHdyb3RlOgo+Cj4gd29ya2RpciBhbmQgZGVzdGRpciBjb3VsZCBiZSB0
aGUgc2FtZSB3aGVuIGNvcHlpbmcgdXAgdG8gaW5kZXhkaXIuCgpUaGlzIGlzIG5vdCB0aGUgcmVh
c29uIGZvciB0aGUgYnVnLCB0aGUgcmVhc29uIGlzOgoKICAgIHN5emJvdCBleGVyY2lzZWQgdGhl
IGZvcmJpZGRlbiBwcmFjdGljZSBvZiBtb3ZpbmcgdGhlIHdvcmtkaXIgdW5kZXIKICAgIGxvd2Vy
ZGlyIHdoaWxlIG92ZXJsYXlmcyBpcyBtb3VudGVkIGFuZCB0cmlwcGVkIGEgZGVudHJ5IHJlZmVy
ZW5jZSBsZWFrLgoKPgo+IEZpeGVzOiBjNjNlNTZhNGE2NTIgKCJvdmw6IGRvIG5vdCBvcGVuL2xs
c2VlayBsb3dlciBmaWxlIHdpdGggdXBwZXIgc2Jfd3JpdGVycyBoZWxkIikKPiBSZXBvcnRlZC1h
bmQtdGVzdGVkLWJ5OiBzeXpib3QrODYwOGJiNDU1M2VkYjhjNzhmNDFAc3l6a2FsbGVyLmFwcHNw
b3RtYWlsLmNvbQo+IFNpZ25lZC1vZmYtYnk6IEVkd2FyZCBBZGFtIERhdmlzIDxlYWRhdmlzQHFx
LmNvbT4KPiAtLS0KPiAgZnMvb3ZlcmxheWZzL2NvcHlfdXAuYyB8IDIwICsrKysrKysrKysrKyst
LS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygt
KQo+Cj4gZGlmZiAtLWdpdCBhL2ZzL292ZXJsYXlmcy9jb3B5X3VwLmMgYi9mcy9vdmVybGF5ZnMv
Y29weV91cC5jCj4gaW5kZXggNDM4Mjg4MWIwNzA5Li5hZTVlYjQ0MjAyNWQgMTAwNjQ0Cj4gLS0t
IGEvZnMvb3ZlcmxheWZzL2NvcHlfdXAuYwo+ICsrKyBiL2ZzL292ZXJsYXlmcy9jb3B5X3VwLmMK
PiBAQCAtNzMxLDEwICs3MzEsMTQgQEAgc3RhdGljIGludCBvdmxfY29weV91cF93b3JrZGlyKHN0
cnVjdCBvdmxfY29weV91cF9jdHggKmMpCj4gICAgICAgICAgICAgICAgIC5yZGV2ID0gYy0+c3Rh
dC5yZGV2LAo+ICAgICAgICAgICAgICAgICAubGluayA9IGMtPmxpbmsKPiAgICAgICAgIH07Cj4g
KyAgICAgICBlcnIgPSAtRUlPOwo+ICsgICAgICAgLyogd29ya2RpciBhbmQgZGVzdGRpciBjb3Vs
ZCBiZSB0aGUgc2FtZSB3aGVuIGNvcHlpbmcgdXAgdG8gaW5kZXhkaXIgKi8KPiArICAgICAgIGlm
IChsb2NrX3JlbmFtZShjLT53b3JrZGlyLCBjLT5kZXN0ZGlyKSAhPSBOVUxMKQo+ICsgICAgICAg
ICAgICAgICBnb3RvIHVubG9jazsKCllvdSBjYW4ndCBkbyB0aGF0LiBTZWUgY29tbWVudCBiZWxv
dyBvdmxfY29weV91cF9kYXRhKCkuCgo+Cj4gICAgICAgICBlcnIgPSBvdmxfcHJlcF9jdV9jcmVk
cyhjLT5kZW50cnksICZjYyk7Cj4gICAgICAgICBpZiAoZXJyKQo+IC0gICAgICAgICAgICAgICBy
ZXR1cm4gZXJyOwo+ICsgICAgICAgICAgICAgICBnb3RvIHVubG9jazsKPgo+ICAgICAgICAgb3Zs
X3N0YXJ0X3dyaXRlKGMtPmRlbnRyeSk7Cj4gICAgICAgICBpbm9kZV9sb2NrKHdkaXIpOwo+IEBA
IC03NDMsOCArNzQ3LDkgQEAgc3RhdGljIGludCBvdmxfY29weV91cF93b3JrZGlyKHN0cnVjdCBv
dmxfY29weV91cF9jdHggKmMpCj4gICAgICAgICBvdmxfZW5kX3dyaXRlKGMtPmRlbnRyeSk7Cj4g
ICAgICAgICBvdmxfcmV2ZXJ0X2N1X2NyZWRzKCZjYyk7Cj4KPiArICAgICAgIGVyciA9IFBUUl9F
UlIodGVtcCk7Cj4gICAgICAgICBpZiAoSVNfRVJSKHRlbXApKQo+IC0gICAgICAgICAgICAgICBy
ZXR1cm4gUFRSX0VSUih0ZW1wKTsKPiArICAgICAgICAgICAgICAgZ290byB1bmxvY2s7Cj4KPiAg
ICAgICAgIC8qCj4gICAgICAgICAgKiBDb3B5IHVwIGRhdGEgZmlyc3QgYW5kIHRoZW4geGF0dHJz
LiBXcml0aW5nIGRhdGEgYWZ0ZXIKPiBAQCAtNzYwLDEwICs3NjUsOSBAQCBzdGF0aWMgaW50IG92
bF9jb3B5X3VwX3dvcmtkaXIoc3RydWN0IG92bF9jb3B5X3VwX2N0eCAqYykKPiAgICAgICAgICAq
IElmIHRlbXAgd2FzIG1vdmVkLCBhYm9ydCB3aXRob3V0IHRoZSBjbGVhbnVwLgo+ICAgICAgICAg
ICovCj4gICAgICAgICBvdmxfc3RhcnRfd3JpdGUoYy0+ZGVudHJ5KTsKPiAtICAgICAgIGlmIChs
b2NrX3JlbmFtZShjLT53b3JrZGlyLCBjLT5kZXN0ZGlyKSAhPSBOVUxMIHx8Cj4gLSAgICAgICAg
ICAgdGVtcC0+ZF9wYXJlbnQgIT0gYy0+d29ya2Rpcikgewo+ICsgICAgICAgaWYgKHRlbXAtPmRf
cGFyZW50ICE9IGMtPndvcmtkaXIpIHsKCiAgICAgICAgICAgICAgICAgIGRwdXQodGVtcCk7Cgpo
ZXJlIGlzIGFsbCB0aGF0IHNob3VsZCBiZSBuZWVkZWQgdG8gZml4IHRoZSBsZWFrLgoKCj4gICAg
ICAgICAgICAgICAgIGVyciA9IC1FSU87Cj4gLSAgICAgICAgICAgICAgIGdvdG8gdW5sb2NrOwo+
ICsgICAgICAgICAgICAgICBnb3RvIHVubG9ja2NkOwo+ICAgICAgICAgfSBlbHNlIGlmIChlcnIp
IHsKPiAgICAgICAgICAgICAgICAgZ290byBjbGVhbnVwOwo+ICAgICAgICAgfQoKU2VlIG15IHN1
Z2dlc3RlZCBmaXggYXQgaHR0cHM6Ly9naXRodWIuY29tL2FtaXI3M2lsL2xpbnV4L2NvbW1pdHMv
b3ZsLWZpeGVzCgpBbCwKCkhlYWRzIHVwLgpUaGlzIGZpeCB3aWxsIGhhdmUgYSBtaW5vciBjb25m
bGljdCB3aXRoIGE4YjAwMjY4NDdiOCAoInJlbmFtZSgpOiBhdm9pZAphIGRlYWRsb2NrIGluIHRo
ZSBjYXNlIG9mIHBhcmVudHMgaGF2aW5nIG5vIGNvbW1vbiBhbmNlc3RvciIpCm9uIHlvdXIgd29y
ay5yZW5hbWUgYnJhbmNoLgoKSSBwbGFuIHRvIHB1c2ggbXkgZml4IHRvIGxpbnV4LW5leHQgc29v
biwgYnV0IEkgc2VlIHRoYXQgd29yay5yZW5hbWUKaXMgbm90IGluIGxpbnV4LW5leHQgeWV0LgoK
VGhhbmtzLApBbWlyLgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlz
dHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xp
c3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
