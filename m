Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D33426DC455
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 10 Apr 2023 10:40:39 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pln4l-0000NX-Dm;
	Mon, 10 Apr 2023 08:40:34 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <qkrwngud825@gmail.com>) id 1pln4f-0000NF-CL
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 10 Apr 2023 08:40:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vnqzGp4XSTEgbvnTU2+4rDiW8T9RnqzrJSxmOVrDsvk=; b=X5BeVgjsdYYxdTcsKSuqhN23jT
 8zPJFlzy0Pv+rrE6ld46LfGsaS9HF2hegFIFa0JwUV/QEdd1IPY8KAdGZt0g2ugLbf2K2acpZk8mH
 ZJMiqAiaG+pc2/NBkxYuGeaYmKbU6GwBVVHon7+uy+Umi8pVlg6QpzotPx8kqwsu5H90=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=vnqzGp4XSTEgbvnTU2+4rDiW8T9RnqzrJSxmOVrDsvk=; b=dMIQqTvt0X8l5Xof+MEFErYk0a
 In+L4zJrvcEqXJIYNGqB1I2Mu6TlCqNn/5HHdsLfC6xri2Rbyo/+CPUjfD7rtkgowlp6Tr7oAjYFe
 hWd/mdHfXeudBh9qxSSH/97jSLR2vX+RU3RcNiKdbbKETmORHH0aUHrGNLJfTAyK73rM=;
Received: from mail-ed1-f44.google.com ([209.85.208.44])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1pln4U-0002lX-Ta for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 10 Apr 2023 08:40:24 +0000
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-50489936a7bso1212127a12.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 10 Apr 2023 01:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1681116008; x=1683708008;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vnqzGp4XSTEgbvnTU2+4rDiW8T9RnqzrJSxmOVrDsvk=;
 b=FUTq11vYwcB2rCHKhtvkLZd4CQUjrcYTJ19x3o7oLGSE0kvyRAKwjarhKKFPiMFmFR
 uTV2IMxanC30wXsOzJ4u3Kvp85X3iBeWSat+Gyn6yVzUC4kEEbhdtlxq2Z9y3FuybvzL
 rS2x0q48tUKZiq3p29QH9fqVlqK12ZQyjsSQyw1WzasvRFU/6dwZ1HnQQv98UzXaPTfc
 aMEIG2R43cwrulwbYFQVucGJuQJ8D3j1VqENrLYYGt0PwgVFukZhMURMj1kOWELnvYzt
 1XD+/8e4B1WuazSXJ6ef1WXVt01TUMYLwE3Qu66V+nbAjhsogdxdksMKK8KXo73T4z2B
 J27w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681116008; x=1683708008;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vnqzGp4XSTEgbvnTU2+4rDiW8T9RnqzrJSxmOVrDsvk=;
 b=wgSoxpPvXtCv8mOEuWQw58S6HSo4t8kwu3N78n/9NNHZRqmtjELiWq2VKSXJEHfxe/
 L/JMglBUCv7H6UxhSpu9PQKMY+OF4hOy+nv/UEJCelhmLow0JQ5snMQhmfBtmumCXbPK
 foHDvABqDzCC6xd/ajNYefsXkXORaT2p1YxzZz01UAXO2TCqlOpmgHTqBqNjvp6OFHV2
 HnVU+X12Y/nUqbZtpGPKBDzmZ6QxzZkavMRpgkDpUDnvEuv22oCwW8ifyVM5gKIMoJgl
 jnT064Av6K6N3oDm419SlvL5gen7y78exPNK0XRRPc7mgOGy+1EHTkgUOqbVgDoW5Ppw
 MVYQ==
X-Gm-Message-State: AAQBX9cnW6umBEOPm8j/TIGJZakSh3ehASgSpkCn3OTOx/qw38nv/fDL
 BzJCgAwlBfa4PloPGYaUdtSwlbMCEdXMUlTjMfgmNIiIt1v9sg==
X-Google-Smtp-Source: AKy350YnGjw4qYgS0M7KMCfHWtnDCIl98OjqrmYsojQXVDgZ1RNrUdX3Rl4SVmB53F3pbt+7KIR6nSBC93RSqEaHADc=
X-Received: by 2002:a50:d75d:0:b0:504:78b1:81b0 with SMTP id
 i29-20020a50d75d000000b0050478b181b0mr4535502edj.5.1681116007822; Mon, 10 Apr
 2023 01:40:07 -0700 (PDT)
MIME-Version: 1.0
References: <CAD14+f3z=kS9E+NTKH7t1J2xL1PpLOVMNx=CabD_t2K6U=T9uQ@mail.gmail.com>
 <ZCy0TBDkzh+VRrnU@google.com>
In-Reply-To: <ZCy0TBDkzh+VRrnU@google.com>
From: Juhyung Park <qkrwngud825@gmail.com>
Date: Mon, 10 Apr 2023 17:39:56 +0900
Message-ID: <CAD14+f1qNSOVWyhDqb=9J+-bJiRvHA4_3OWfhH+WOZXXuodQ4w@mail.gmail.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>
X-Spam-Score: 1.3 (+)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Hi Jaegeuk, sorry for the late reply. On Wed, Apr 5, 2023
   at 8:35 AM Jaegeuk Kim wrote: > > Hi Juhyung, > > > So here’s my proposal:
    > > As Linux distros don’t have a good mechanism for hinting when to >
   > trigger GC, introduce a [...] 
 
 Content analysis details:   (1.3 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.3 HK_RANDOM_FROM         From username looks random
  1.0 HK_RANDOM_ENVFROM      Envelope sender username looks random
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.208.44 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
                             in digit
                             [qkrwngud825[at]gmail.com]
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [qkrwngud825[at]gmail.com]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.208.44 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
X-Headers-End: 1pln4U-0002lX-Ta
Subject: Re: [f2fs-dev] [DISCUSSION] f2fs for desktop
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
Cc: Alexander Koskovich <akoskovich@pm.me>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

SGkgSmFlZ2V1aywgc29ycnkgZm9yIHRoZSBsYXRlIHJlcGx5LgoKT24gV2VkLCBBcHIgNSwgMjAy
MyBhdCA4OjM14oCvQU0gSmFlZ2V1ayBLaW0gPGphZWdldWtAa2VybmVsLm9yZz4gd3JvdGU6Cj4K
PiBIaSBKdWh5dW5nLAo+Cj4gPiBTbyBoZXJl4oCZcyBteSBwcm9wb3NhbDoKPiA+IEFzIExpbnV4
IGRpc3Ryb3MgZG9u4oCZdCBoYXZlIGEgZ29vZCBtZWNoYW5pc20gZm9yIGhpbnRpbmcgd2hlbiB0
bwo+ID4gdHJpZ2dlciBHQywgaW50cm9kdWNlIGEgbmV3IEtjb25maWcsIENPTkZJR19GMkZTX0dD
X1VQT05fRlNUUklNIGFuZAo+ID4gZW5hYmxlIGl0IGJ5IGRlZmF1bHQuCj4gPiBUaGlzIGNvbmZp
ZyB3aWxsIGhvb2sgdXAgaW9jdGwoRklUUklNKSwgd2hpY2ggaXMgY3VycmVudGx5IGlnbm9yZWQg
b24KPiA+IGYyZnMgLSBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVs
L2dpdC9qYWVnZXVrL2YyZnMuZ2l0L2NvbW1pdC8/aD1tYXN0ZXImaWQ9ZTU1NWRhOWYzMTIxMGQy
YjYyODA1Y2Q3ZmFmMjkyMjhhZjdjM2NmYgo+ID4gLCB0byBwZXJmb3JtIGRpc2NhcmQgYW5kIEdD
IG9uIGFsbCBpbnZhbGlkIHNlZ21lbnRzLgo+ID4gVXNlcnNwYWNlIGNvbmZpZ3VyYXRpb24gd2l0
aCBlbm91Z2ggZjJmcy9HQyBrbm93bGVkZ2Ugc3VjaCBhcyBBbmRyb2lkCj4gPiBzaG91bGQgZGlz
YWJsZSBpdC4KPgo+IEhvdyBhYm91dCBhZGRpbmcgYW4gb3B0aW9uIGxpa2UgIm1lbW9yeT1oaWdo
IiB0byB0dW5lIGJhY2tncm91bmQgR0MgcGFyYW1ldGVycwo+IHNlYW1sZXNzbHk/Cj4KCkNhbiB5
b3UgZWxhYm9yYXRlIHRoaXMgZGVzaWduPwpOb3Qgc3VyZSB3aGF0IGJvdGggIm1lbW9yeSIgYW5k
ICJoaWdoIiBtZWFuIGluIHRoYXQgY29udGV4dC4KCkV2ZW4gaWYgd2UgdHVuZSBCRyBHQyBwYXJh
bWV0ZXJzLCBJIHN0aWxsIHRoaW5rIHRoZSBzYW1lIHByb2JsZW0KZXhpc3RzOiB3ZSBkb24ndCBr
bm93IHdoaWNoIGhldXJpc3RpYyBjb3ZlcnMgYWxsIHdvcmtsb2FkcyBhbmQgYWdlZAplbnZpcm9u
bWVudHMuCgpJIGxpa2UgdGhlIGlkZWEgb2YgYSBkeW5hbWljIEdDIHR1bmVyIGluIHRoZSBrZXJu
ZWwgKGlmIHRoYXQncyB3aGF0CnlvdSBtZWFudCksIGJ1dCBJIHRoaW5rIGl0J3MgY29tcGxpbWVu
dGFyeSB0byB0aGUgcHJvcG9zZWQKQ09ORklHX0YyRlNfR0NfVVBPTl9GU1RSSU0sIG5vdCBhIHJl
cGxhY2VtZW50IHVubGVzcyB3ZSdyZSAxMDAlCmNlcnRhaW4gdGhhdCBpdCBjYW4gY292ZXIgYWxs
IHdvcmtsb2Fkcy4gTXkgcHJvcG9zZWQKQ09ORklHX0YyRlNfR0NfVVBPTl9GU1RSSU0gY2FuIGFj
dCBhcyBhIHNhZmVndWFyZCB0byAqbm90KiBpbnRyb2R1Y2UKYW55IG1vcmUgcGVyZm9ybWFuY2Ug
c2xvd2Rvd25zIGNvbXBhcmVkIHRvIG90aGVyIGZpbGUtc3lzdGVtcy4KCj4gPgo+ID4gPT09IEMu
IEV4dGVuZGVkIG5vZGUgYml0bWFwID09PQo+ID4KPiA+IGYyZnMgYnkgZGVmYXVsdCBoYXZlIGEg
dmVyeSBsaW1pdGVkIG51bWJlciBvZiBhbGxvd2VkIGlub2RlcyBjb21wYXJlZAo+ID4gdG8gb3Ro
ZXIgZmlsZS1zeXN0ZW1zLiBKdXN0IDIgQU9TUCBzeW5jcyBhcmUgZW5vdWdoIHRvIGV4aGF1c3Qg
ZjJmcwo+ID4gYW5kIHJlc3VsdCBpbiAtRU5PU1BDLgo+ID4KPiA+IEhlcmUgYXJlIHNvbWUgb2Yg
dGhlIHN0YXRzIGNvbGxlY3RlZCBmcm9tIG1lIGFuZCBteSBjb2xsZWFndWUgdGhhdCB3ZQo+ID4g
dXNlIGRhaWx5IGFzIGEgcmVndWxhciBkZXNrdG9wIHdpdGggR1VJLCB3ZWItYnJvd3NpbmcgYW5k
IGV2ZXJ5dGhpbmc6Cj4gPiAxLiBMYXB0b3AKPiA+IFV0aWxpemF0aW9uOiA2OCUgKDE4MjkxNDg1
MCB2YWxpZCBibG9ja3MsIDQ2MiBkaXNjYXJkIGJsb2NrcykKPiA+ICAgLSBOb2RlOiAxMDIzNDkw
NSAoSW5vZGU6IDEwMTA2NTI2LCBPdGhlcjogMTI4Mzc5KQo+ID4gICAtIERhdGE6IDE3MjY3OTk0
NQo+ID4gICAtIElubGluZV94YXR0ciBJbm9kZTogMjAwNDgyNwo+ID4gICAtIElubGluZV9kYXRh
IElub2RlOiA4NjcyMDQKPiA+ICAgLSBJbmxpbmVfZGVudHJ5IElub2RlOiA1MTQ1Ngo+ID4KPiA+
IDIuIERlc2t0b3AgIzEKPiA+IFV0aWxpemF0aW9uOiA1NSUgKDEzMzMxMDQ2NSB2YWxpZCBibG9j
a3MsIDAgZGlzY2FyZCBibG9ja3MpCj4gPiAgIC0gTm9kZTogNjM4OTY2MCAoSW5vZGU6IDYyODk3
NjUsIE90aGVyOiA5OTg5NSkKPiA+ICAgLSBEYXRhOiAxMjY5MjA4MDUKPiA+ICAgLSBJbmxpbmVf
eGF0dHIgSW5vZGU6IDIyNTM4MzgKPiA+ICAgLSBJbmxpbmVfZGF0YSBJbm9kZTogMTExOTEwOQo+
ID4gICAtIElubGluZV9kZW50cnkgSW5vZGU6IDE4Nzk1OAo+ID4KPiA+IDMuIERlc2t0b3AgIzIK
PiA+IFV0aWxpemF0aW9uOiA4MyUgKDIwMjIyMjAwMyB2YWxpZCBibG9ja3MsIDEgZGlzY2FyZCBi
bG9ja3MpCj4gPiAgIC0gTm9kZTogMjE4ODc4MzYgKElub2RlOiAyMTc1NzEzOSwgT3RoZXI6IDEz
MDY5NykKPiA+ICAgLSBEYXRhOiAxODAzMzQxNjcKPiA+ICAgLSBJbmxpbmVfeGF0dHIgSW5vZGU6
IDM5MjkyCj4gPiAgIC0gSW5saW5lX2RhdGEgSW5vZGU6IDM1MjEzCj4gPiAgIC0gSW5saW5lX2Rl
bnRyeSBJbm9kZTogMTEyNwo+ID4KPiA+IDQuIENvbGxlYWd1ZQo+ID4gVXRpbGl6YXRpb246IDIy
JSAoMTA4NjUyOTI5IHZhbGlkIGJsb2NrcywgMzYyNDIwNjA1IGRpc2NhcmQgYmxvY2tzKQo+ID4g
ICAtIE5vZGU6IDU2MjkzNDggKElub2RlOiA1NTQyOTA5LCBPdGhlcjogODY0MzkpCj4gPiAgIC0g
RGF0YTogMTAzMDIzNTgxCj4gPiAgIC0gSW5saW5lX3hhdHRyIElub2RlOiA2NTU3NTIKPiA+ICAg
LSBJbmxpbmVfZGF0YSBJbm9kZTogMjU5OTAwCj4gPiAgIC0gSW5saW5lX2RlbnRyeSBJbm9kZTog
MTkzMDAwCj4gPgo+ID4gNS4gQW5kcm9pZCBwaG9uZSAoZm9yIHJlZmVyZW5jZSkKPiA+IFV0aWxp
emF0aW9uOiA3OCUgKDM2NTA1NzEzIHZhbGlkIGJsb2NrcywgMTA3NCBkaXNjYXJkIGJsb2NrcykK
PiA+ICAgLSBOb2RlOiA3MDQ2OTggKElub2RlOiA2ODMzMzcsIE90aGVyOiAyMTM2MSkKPiA+ICAg
LSBEYXRhOiAzNTgwMTAxNQo+ID4gICAtIElubGluZV94YXR0ciBJbm9kZTogNjgzMzMzCj4gPiAg
IC0gSW5saW5lX2RhdGEgSW5vZGU6IDIzNzQ3MAo+ID4gICAtIElubGluZV9kZW50cnkgSW5vZGU6
IDExMjE3Nwo+ID4KPiA+IENoYW8gWXUgYWRkZWQgYSBmdW5jdGlvbmFsaXR5IHRvIGV4cGFuZCB0
aGlzIHZpYSB0aGUgLWkgZmxhZyBwYXNzZWQgdG8KPiA+IG1rZnMuZjJmcyBiYWNrIGluIDIwMTgg
LQo+ID4gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvamFl
Z2V1ay9mMmZzLXRvb2xzLmdpdC9jb21taXQvP2lkPWJhYWEwNzZiNGQ1NzYwNDI5MTNjZmUzNDE2
OTQ0MmRmZGE2NTFjYTQKPiA+Cj4gPiBJIG9jY2FzaW9uYWxseSBmaW5kIG15c2VsZiBpbiBhIHdl
aXJkIHBvc2l0aW9uIG9mIGhhdmluZyB0byB0ZWxsCj4gPiBwZW9wbGUgIk9oIHlvdSBzaG91bGQg
dXNlIHRoZSAtaSBvcHRpb24gZnJvbSBta2ZzLmYyZnMiIHdoZW4gdGhleQo+ID4gZW5jb3VudGVy
IHRoaXMgaXNzdWUgb25seSBhZnRlciB0aGV54oCZdmUgbWlncmF0ZWQgbW9zdCBvZiB0aGUgZGF0
YSBhbmQKPiA+IGFzayBiYWNrICJXaHkgaXNu4oCZdCB0aGlzIGVuYWJsZWQgYnkgZGVmYXVsdD8i
Lgo+ID4KPiA+IFdoaWxlIHRoaXMgbWlnaHQgbm90IGJlIGFuIGlzc3VlIGZvciB0aGUgZm9yZXNl
ZWFibGUgZnV0dXJlIGluCj4gPiBBbmRyb2lkLCBJ4oCZZCBhcmd1ZSB0aGF0IHRoaXMgaXMgYSBm
ZWF0dXJlIHRoYXQgbmVlZHMgdG8gYmUgZW5hYmxlZCBieQo+ID4gZGVmYXVsdCBmb3IgZGVza3Rv
cCBlbnZpcm9ubWVudHMgd2l0aCBwcmVmZXJhYmx5IGEgcm9idXN0IHRlc3RpbmcKPiA+IGluZnJh
c3RydWN0dXJlLiBHdWFyZGluZyB0aGlzIHdpdGggI2lmbmRlZiBfX0FORFJPSURfXyBkb2VzbuKA
mXQgc2VlbSB0bwo+ID4gbWFrZSBtdWNoIHNlbnNlIGFzIGl0IGludHJvZHVjZXMgbW9yZSBjb21w
bGljYXRpb25zIHRvIGhvdwo+ID4gZnV6emluZy90ZXN0aW5nIHNob3VsZCBiZSBkb25lLgo+ID4K
PiA+IEnigJlsbCBhbHNvIGFkZCB0aGF0IGl04oCZcyBhIGNvbW1vbiBwcmFjdGljZSBmb3IgdXNl
cnNwYWNlIG1rZnMgdG9vbHMgdG8KPiA+IGludHJvZHVjZSBicmVha2luZyBkZWZhdWx0IGNoYW5n
ZXMgdG8gb2xkZXIga2VybmVscyAod2l0aCBvcHRpb25zIHRvCj4gPiBwcm9kdWNlIGEgbGVnYWN5
IGltYWdlLCBvZiBjb3Vyc2UpLgo+Cj4gRG8geW91IGhhdmUgc29tZSBtZWFzdXJlbWVudHMgcmVn
YXJkaW5nIHRvIHRoZSBhZGRpdGlvbmFsIHNwYWNlIHRoYXQgbGFyZ2UgTkFUCj4gb2NjdXBpZXM/
Cj4KCklzIHRoaXMgc29tZXRoaW5nIHRoYXQgZjJmcycgZGVidWdmcyBjYXB0dXJlcz8KSWYgbm90
LCBwbGVhc2UgbGV0IG1lIGtub3cgaWYgdGhlcmUncyBhIHN0YW5kYXJkIHByYWN0aWNlIG9uIGhv
dyB0byBtZWFzdXJlIGl0LgoKZGVidWdmcyBvdXRwdXQgb24gZWFjaCBzeXN0ZW0gaW4gb3JkZXI6
Cgo9PT09PVsgcGFydGl0aW9uIGluZm8obnZtZTBuMXA0KS4gIzAsIFJXLCBDUDogR29vZF09PT09
PQpbU0JJOiBmc19kaXJ0eSByZWNvdmVyZWRdCltTQjogMV0gW0NQOiAyXSBbU0lUOiAzOF0gW05B
VDogNDYwXSBbU1NBOiAxMDI0XSBbTUFJTjoKNTIyNzYzKE92ZXJQcm92OjIwNTAgUmVzdjoxMDA3
KV0KCkN1cnJlbnQgVGltZSBTZWM6IDIyOTMyNyAvIE1vdW50ZWQgVGltZSBTZWM6IDAKClBvbGlj
eToKICAtIElQVTogWyBGU1lOQyBdCgpVdGlsaXphdGlvbjogNjglICgxODI4ODUxMTggdmFsaWQg
YmxvY2tzLCA1OTggZGlzY2FyZCBibG9ja3MpCiAgLSBOb2RlOiAxMDIyMjgzMSAoSW5vZGU6IDEw
MDk0NDY5LCBPdGhlcjogMTI4MzYyKQogIC0gRGF0YTogMTcyNjYyMjg3CiAgLSBJbmxpbmVfeGF0
dHIgSW5vZGU6IDI0NDQ3MAogIC0gSW5saW5lX2RhdGEgSW5vZGU6IDkyNDE0CiAgLSBJbmxpbmVf
ZGVudHJ5IElub2RlOiAxNjQ5NwogIC0gQ29tcHJlc3NlZCBJbm9kZTogMCwgQmxvY2tzOiAwCiAg
LSBTd2FwZmlsZSBJbm9kZTogMAogIC0gT3JwaGFuL0FwcGVuZC9VcGRhdGUgSW5vZGU6IDI2LCAw
LCAwCgpNYWluIGFyZWE6IDUyMjc2MyBzZWdzLCA1MjI3NjMgc2VjcyA1MjI3NjMgem9uZXMKICAg
IFRZUEUgICAgICAgICAgICBzZWdubyAgICBzZWNubyAgIHpvbmVubyAgZGlydHlfc2VnICAgZnVs
bF9zZWcgIHZhbGlkX2JsawogIC0gQ09MRCAgIGRhdGE6ICAgNDk2Mjg3ICAgNDk2Mjg3ICAgNDk2
Mjg3ICAgICAgIDIxMjggICAgICA3MzA1NyAgIDM4MzcyMzgzCiAgLSBXQVJNICAgZGF0YTogICA0
OTY0MTAgICA0OTY0MTAgICA0OTY0MTAgICAgICAgIDY2MSAgICAgMjQyNjc1ICAxMjQzNzk2NjYK
ICAtIEhPVCAgICBkYXRhOiAgICAyMjM2OCAgICAyMjM2OCAgICAyMjM2OCAgICAgICAgMTYxICAg
ICAgMTkxOTUgICAgOTg1NjA5OAogIC0gRGlyICAgZG5vZGU6ICAgIDIwOTY0ICAgIDIwOTY0ICAg
IDIwOTY0ICAgICAgICAgNzAgICAgICAgMjQ4MSAgICAxMzAxNDA0CiAgLSBGaWxlICBkbm9kZTog
ICAgMjI4OTMgICAgMjI4OTMgICAgMjI4OTMgICAgICAgIDc1MyAgICAgIDE2NzQyICAgIDg5MTMx
ODkKICAtIEluZGlyIG5vZGVzOiAgICAgIDgyMiAgICAgIDgyMiAgICAgIDgyMiAgICAgICAgICAz
ICAgICAgICAgMTQgICAgICAgODIyNQogIC0gUGlubmVkIGZpbGU6ICAgICAgIC0xICAgICAgIC0x
ICAgICAgIC0xCiAgLSBBVEdDICAgZGF0YTogICAgICAgLTEgICAgICAgLTEgICAgICAgLTEKCiAg
LSBWYWxpZDogMzU0MTcwCiAgLSBEaXJ0eTogMzc3MAogIC0gUHJlZnJlZTogMAogIC0gRnJlZTog
MTY0ODIzICgxNjQ4MjMpCgpDUCBjYWxsczogMTYwMCAoQkc6IDQyMCkKICAtIGNwIGJsb2NrcyA6
IDEyOTg2CiAgLSBzaXQgYmxvY2tzIDogMjUwNDYKICAtIG5hdCBibG9ja3MgOiAzNTMzNgogIC0g
c3NhIGJsb2NrcyA6IDg1MDQKQ1AgbWVyZ2U6CiAgLSBRdWV1ZWQgOiAgICAwCiAgLSBJc3N1ZWQg
OiAxNjYwCiAgLSBUb3RhbCA6IDE2NjMKICAtIEN1ciB0aW1lIDogICAgMShtcykKICAtIFBlYWsg
dGltZSA6ICAxNjUobXMpCkdDIGNhbGxzOiAxMTU1IChCRzogMTE1NikKICAtIGRhdGEgc2VnbWVu
dHMgOiA5OTMgKDk5MykKICAtIG5vZGUgc2VnbWVudHMgOiAxNjIgKDE2MikKICAtIFJlY2xhaW1l
ZCBzZWdzIDoKICAgIC0gTm9ybWFsIDogNwogICAgLSBJZGxlIENCIDogMAogICAgLSBJZGxlIEdy
ZWVkeSA6IDAKICAgIC0gSWRsZSBBVCA6IDAKICAgIC0gVXJnZW50IEhpZ2ggOiAxMTQ4CiAgICAt
IFVyZ2VudCBNaWQgOiAwCiAgICAtIFVyZ2VudCBMb3cgOiAwClRyeSB0byBtb3ZlIDE3NzkyMCBi
bG9ja3MgKEJHOiAxNzc5MjApCiAgLSBkYXRhIGJsb2NrcyA6IDE1MjMzNyAoMTUyMzM3KQogIC0g
bm9kZSBibG9ja3MgOiAyNTU4MyAoMjU1ODMpCkJHIHNraXAgOiBJTzogMTQzLCBPdGhlcjogMTAK
CkV4dGVudCBDYWNoZSAoUmVhZCk6CiAgLSBIaXQgQ291bnQ6IEwxLTE6MjkwNDk0IEwxLTI6MzYz
MTYgTDI6Mzg3MgogIC0gSGl0IFJhdGlvOiAxNyUgKDMzMDY4MiAvIDE4ODUyOTUpCiAgLSBJbm5l
ciBTdHJ1Y3QgQ291bnQ6IHRyZWU6IDIyMzY2MCgwKSwgbm9kZTogMTA4NTg2CgpFeHRlbnQgQ2Fj
aGUgKEJsb2NrIEFnZSk6CiAgLSBBbGxvY2F0ZWQgRGF0YSBCbG9ja3M6IDI1NjExNDIKICAtIEhp
dCBDb3VudDogTDE6MCBMMjowCiAgLSBIaXQgUmF0aW86IDAlICgwIC8gMCkKICAtIElubmVyIFN0
cnVjdCBDb3VudDogdHJlZTogMCgwKSwgbm9kZTogMAoKQmFsYW5jaW5nIEYyRlMgQXN5bmM6CiAg
LSBESU8gKFI6ICAgIDAsIFc6ICAgIDApCiAgLSBJT19SIChEYXRhOiAgICAwLCBOb2RlOiAgICAw
LCBNZXRhOiAgICAwCiAgLSBJT19XIChDUDogICAgMCwgRGF0YTogICAgMCwgRmx1c2g6ICggICAw
IDE1OTgwICAgIDEpLCBEaXNjYXJkOiAoCjAgMTE0OTkpKSBjbWQ6IDI0NzcxIHVuZGlzY2FyZDo1
OTIzODgKICAtIGF0b21pYyBJTzogICAgMCAoTWF4LiAgICAzKQogIC0gY29tcHJlc3M6ICAgIDAs
IGhpdDogICAgICAgMAogIC0gbm9kZXM6ICAgMzYgaW4gNDg4NDAKICAtIGRlbnRzOiAgIDE5IGlu
IGRpcnM6ICAgNSAoICA0NSkKICAtIGRhdGFzOiAgMjQ5IGluIGZpbGVzOiAgIDAKICAtIHF1b3Rh
IGRhdGFzOiAgICAwIGluIHF1b3RhIGZpbGVzOiAgIDAKICAtIG1ldGE6ICAgIDIgaW4gNDg5Mwog
IC0gaW1ldGE6ICAgMzEKICAtIGZzeW5jIG1hcms6ICAgMjIKICAtIE5BVHM6ICAgICAgICA2Ni8g
ICAgOTk4MDUKICAtIFNJVHM6ICAgICAgICAzNS8gICA1MjI3NjMKICAtIGZyZWVfbmlkczogICAg
ICA5MzYwLyA0MzM1NzkzMwogIC0gYWxsb2NfbmlkczogICAgICAgICAwCgpEaXN0cmlidXRpb24g
b2YgVXNlciBCbG9ja3M6IFsgdmFsaWQgfCBpbnZhbGlkIHwgZnJlZSBdCiAgWy0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS18LXwtLS0tLS0tLS0tLS0tLS1dCgpJUFU6IDMwOTI4IGJs
b2NrcwpTU1I6IDE1NzMzOSBibG9ja3MgaW4gMzUxNCBzZWdtZW50cwpMRlM6IDI1NDg5MjYgYmxv
Y2tzIGluIDQ5Nzkgc2VnbWVudHMKCkJERjogOTksIGF2Zy4gdmJsb2NrczogMzk2CgpNZW1vcnk6
IDM3NDc0NyBLQgogIC0gc3RhdGljOiAxMjY5MDAgS0IKICAtIGNhY2hlZCBhbGw6IDMyOTE0IEtC
CiAgLSByZWFkIGV4dGVudCBjYWNoZTogMjY4NTUgS0IKICAtIGJsb2NrIGFnZSBleHRlbnQgY2Fj
aGU6IDAgS0IKICAtIHBhZ2VkIDogMjE0OTMyIEtCCgo9PT09PVsgcGFydGl0aW9uIGluZm8obnZt
ZTBuMXAzKS4gIzAsIFJXLCBDUDogR29vZF09PT09PQpbU0I6IDFdIFtDUDogMl0gW1NJVDogMzRd
IFtOQVQ6IDQxOF0gW1NTQTogOTMwXSBbTUFJTjoKNDc0NzgxKE92ZXJQcm92OjE5NTUgUmVzdjo5
NjApXQoKQ3VycmVudCBUaW1lIFNlYzogMjE0NDgyMiAvIE1vdW50ZWQgVGltZSBTZWM6IDIKClBv
bGljeToKICAtIElQVTogWyBGU1lOQyBdCgpVdGlsaXphdGlvbjogNTUlICgxMzM0ODQ1ODMgdmFs
aWQgYmxvY2tzLCAwIGRpc2NhcmQgYmxvY2tzKQogIC0gTm9kZTogNjM2NTg3NCAoSW5vZGU6IDYy
NjUxMjgsIE90aGVyOiAxMDA3NDYpCiAgLSBEYXRhOiAxMjcxMTg3MDkKICAtIElubGluZV94YXR0
ciBJbm9kZTogMjI3MTQxMQogIC0gSW5saW5lX2RhdGEgSW5vZGU6IDExMjAxNjcKICAtIElubGlu
ZV9kZW50cnkgSW5vZGU6IDIyNjI0NQogIC0gQ29tcHJlc3NlZCBJbm9kZTogMCwgQmxvY2tzOiAw
CiAgLSBTd2FwZmlsZSBJbm9kZTogMAogIC0gT3JwaGFuL0FwcGVuZC9VcGRhdGUgSW5vZGU6IDEy
LCAwLCAwCgpNYWluIGFyZWE6IDQ3NDc4MSBzZWdzLCA0NzQ3ODEgc2VjcyA0NzQ3ODEgem9uZXMK
ICAgIFRZUEUgICAgICAgICAgICBzZWdubyAgICBzZWNubyAgIHpvbmVubyAgZGlydHlfc2VnICAg
ZnVsbF9zZWcgIHZhbGlkX2JsawogIC0gQ09MRCAgIGRhdGE6ICAgMzI2NDgwICAgMzI2NDgwICAg
MzI2NDgwICAgICAgICAgNTkgICAgICAzMzYyNSAgIDE3MjQ1Nzc5CiAgLSBXQVJNICAgZGF0YTog
ICAgOTQ2NjUgICAgOTQ2NjUgICAgOTQ2NjUgICAgICAgICAyMiAgICAgMTk0OTE2ICAgOTk4MDgw
NTYKICAtIEhPVCAgICBkYXRhOiAgICAxMTczOSAgICAxMTczOSAgICAxMTczOSAgICAgICAgICA3
ICAgICAgMTk0NzMgICAgOTk3MzM3MgogIC0gRGlyICAgZG5vZGU6ICAgICA2NTI1ICAgICA2NTI1
ICAgICA2NTI1ICAgICAgICAxMDMgICAgICAgMTIzMSAgICAgNjgyMTY1CiAgLSBGaWxlICBkbm9k
ZTogICAgIDg5NTcgICAgIDg5NTcgICAgIDg5NTcgICAgICAgIDYyMSAgICAgIDEwNDc3ICAgIDU2
Nzk3MDkKICAtIEluZGlyIG5vZGVzOiAgICAgIDYwOSAgICAgIDYwOSAgICAgIDYwOSAgICAgICAg
ICAxICAgICAgICAgIDcgICAgICAgNDAwMAogIC0gUGlubmVkIGZpbGU6ICAgICAgIC0xICAgICAg
IC0xICAgICAgIC0xCiAgLSBBVEdDICAgZGF0YTogICAgICAgLTEgICAgICAgLTEgICAgICAgLTEK
CiAgLSBWYWxpZDogMjU5NzM1CiAgLSBEaXJ0eTogODA3CiAgLSBQcmVmcmVlOiAwCiAgLSBGcmVl
OiAyMTQyMzkgKDIxNDIzOSkKCkNQIGNhbGxzOiAzOTg2MSAoQkc6IDM0NzQ5KQogIC0gY3AgYmxv
Y2tzIDogMzIyMDQzCiAgLSBzaXQgYmxvY2tzIDogMjE4Mjc5CiAgLSBuYXQgYmxvY2tzIDogMjA3
MDA4NgogIC0gc3NhIGJsb2NrcyA6IDU1NTE0CkNQIG1lcmdlOgogIC0gUXVldWVkIDogICAgMAog
IC0gSXNzdWVkIDogNDA2NjUKICAtIFRvdGFsIDogNDA2NzkKICAtIEN1ciB0aW1lIDogICAgMCht
cykKICAtIFBlYWsgdGltZSA6ICA2NjgobXMpCkdDIGNhbGxzOiAzMjkzNiAoQkc6IDMzMTkxKQog
IC0gZGF0YSBzZWdtZW50cyA6IDEyMzE5ICgxMjMxOSkKICAtIG5vZGUgc2VnbWVudHMgOiAyMDYx
NyAoMjA2MTcpCiAgLSBSZWNsYWltZWQgc2VncyA6CiAgICAtIE5vcm1hbCA6IDMyOTM2CiAgICAt
IElkbGUgQ0IgOiAwCiAgICAtIElkbGUgR3JlZWR5IDogMAogICAgLSBJZGxlIEFUIDogMAogICAg
LSBVcmdlbnQgSGlnaCA6IDAKICAgIC0gVXJnZW50IE1pZCA6IDAKICAgIC0gVXJnZW50IExvdyA6
IDAKVHJ5IHRvIG1vdmUgMTM2MjI3MTQgYmxvY2tzIChCRzogMTM2MjI3MTQpCiAgLSBkYXRhIGJs
b2NrcyA6IDQzNTQ3NTEgKDQzNTQ3NTEpCiAgLSBub2RlIGJsb2NrcyA6IDkyNjc5NjMgKDkyNjc5
NjMpCkJHIHNraXAgOiBJTzogNzQwLCBPdGhlcjogMAoKRXh0ZW50IENhY2hlIChSZWFkKToKICAt
IEhpdCBDb3VudDogTDEtMTo0NDA0MjgyIEwxLTI6MjQ0OTYzMiBMMjo2MTQ0OAogIC0gSGl0IFJh
dGlvOiAzNCUgKDY5MTUzNjIgLyAyMDIzNzA5MikKICAtIElubmVyIFN0cnVjdCBDb3VudDogdHJl
ZTogMjAyNDUzMCgwKSwgbm9kZTogODQ4NjgxCgpFeHRlbnQgQ2FjaGUgKEJsb2NrIEFnZSk6CiAg
LSBBbGxvY2F0ZWQgRGF0YSBCbG9ja3M6IDE3ODUxNDM1CiAgLSBIaXQgQ291bnQ6IEwxOjAgTDI6
MAogIC0gSGl0IFJhdGlvOiAwJSAoMCAvIDApCiAgLSBJbm5lciBTdHJ1Y3QgQ291bnQ6IHRyZWU6
IDAoMCksIG5vZGU6IDAKCkJhbGFuY2luZyBGMkZTIEFzeW5jOgogIC0gRElPIChSOiAgICAwLCBX
OiAgICAwKQogIC0gSU9fUiAoRGF0YTogICAgMCwgTm9kZTogICAgMCwgTWV0YTogICAgMAogIC0g
SU9fVyAoQ1A6ICAgIDAsIERhdGE6ICAgIDAsIEZsdXNoOiAoICAgMCAgICAwICAgIDEpLCBEaXNj
YXJkOiAoCjAgNzg4NTcpKSBjbWQ6IDE4NTIgdW5kaXNjYXJkOjI4NzMKICAtIGF0b21pYyBJTzog
ICAgMCAoTWF4LiAgICAwKQogIC0gY29tcHJlc3M6ICAgIDAsIGhpdDogICAgICAgMAogIC0gbm9k
ZXM6ICAgIDAgaW4gMzU2ODUwOQogIC0gZGVudHM6ICAgIDAgaW4gZGlyczogICAwICggICAyKQog
IC0gZGF0YXM6ICAgIDAgaW4gZmlsZXM6ICAgMAogIC0gcXVvdGEgZGF0YXM6ICAgIDAgaW4gcXVv
dGEgZmlsZXM6ICAgMAogIC0gbWV0YTogICAgMCBpbiA4MDExOAogIC0gaW1ldGE6ICAgIDAKICAt
IGZzeW5jIG1hcms6ICAgIDAKICAtIE5BVHM6ICAgICAgICAgMC8gICAgOTk4MDIKICAtIFNJVHM6
ICAgICAgICAgMC8gICA0NzQ3ODEKICAtIGZyZWVfbmlkczogICAgIDc1ODQyLyA0MjMyMjc2Mwog
IC0gYWxsb2NfbmlkczogICAgICAgICAwCgpEaXN0cmlidXRpb24gb2YgVXNlciBCbG9ja3M6IFsg
dmFsaWQgfCBpbnZhbGlkIHwgZnJlZSBdCiAgWy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLXwt
fC0tLS0tLS0tLS0tLS0tLS0tLS0tLS1dCgpJUFU6IDEwNjA4MzcgYmxvY2tzClNTUjogMCBibG9j
a3MgaW4gMCBzZWdtZW50cwpMRlM6IDI4NDIyODEzIGJsb2NrcyBpbiA1NTUxNCBzZWdtZW50cwoK
QkRGOiA5OSwgYXZnLiB2YmxvY2tzOiA1MDYKCk1lbW9yeTogMTQ5NDg1MzAgS0IKICAtIHN0YXRp
YzogMTE1MjU5IEtCCiAgLSBjYWNoZWQgYWxsOiAyMzg3NjMgS0IKICAtIHJlYWQgZXh0ZW50IGNh
Y2hlOiAyMzM2NTUgS0IKICAtIGJsb2NrIGFnZSBleHRlbnQgY2FjaGU6IDAgS0IKICAtIHBhZ2Vk
IDogMTQ1OTQ1MDggS0IKCj09PT09WyBwYXJ0aXRpb24gaW5mbyhudm1lMW4xcDEpLiAjMSwgUlcs
IENQOiBHb29kXT09PT09CltTQjogMV0gW0NQOiAyXSBbU0lUOiAzNF0gW05BVDogNDE4XSBbU1NB
OiA5MzFdIFtNQUlOOgo0NzU1NDgoT3ZlclByb3Y6MTk1NiBSZXN2Ojk2MCldCgpDdXJyZW50IFRp
bWUgU2VjOiAyMTQ0ODIyIC8gTW91bnRlZCBUaW1lIFNlYzogMwoKUG9saWN5OgogIC0gSVBVOiBb
IEZTWU5DIF0KClV0aWxpemF0aW9uOiA4MyUgKDIwMjIyNDE0OCB2YWxpZCBibG9ja3MsIDI2IGRp
c2NhcmQgYmxvY2tzKQogIC0gTm9kZTogMjE4ODgxNzUgKElub2RlOiAyMTc1NzQ3OCwgT3RoZXI6
IDEzMDY5NykKICAtIERhdGE6IDE4MDMzNTk3MwogIC0gSW5saW5lX3hhdHRyIElub2RlOiAzOTY2
NQogIC0gSW5saW5lX2RhdGEgSW5vZGU6IDM1NTMwCiAgLSBJbmxpbmVfZGVudHJ5IElub2RlOiAx
MTMzCiAgLSBDb21wcmVzc2VkIElub2RlOiAwLCBCbG9ja3M6IDAKICAtIFN3YXBmaWxlIElub2Rl
OiAwCiAgLSBPcnBoYW4vQXBwZW5kL1VwZGF0ZSBJbm9kZTogMCwgMCwgMAoKTWFpbiBhcmVhOiA0
NzU1NDggc2VncywgNDc1NTQ4IHNlY3MgNDc1NTQ4IHpvbmVzCiAgICBUWVBFICAgICAgICAgICAg
c2Vnbm8gICAgc2Vjbm8gICB6b25lbm8gIGRpcnR5X3NlZyAgIGZ1bGxfc2VnICB2YWxpZF9ibGsK
ICAtIENPTEQgICBkYXRhOiAgIDM3MTM5NCAgIDM3MTM5NCAgIDM3MTM5NCAgICAgICAgICA0ICAg
ICAxMjUwNTQgICA2NDAyOTU0NAogIC0gV0FSTSAgIGRhdGE6ICAgIDYyODcyICAgIDYyODcyICAg
IDYyODcyICAgICAgICAgIDIgICAgIDIxMzU4OCAgMTA5MzU3OTk1CiAgLSBIT1QgICAgZGF0YTog
ICAgNTY0MTYgICAgNTY0MTYgICAgNTY0MTYgICAgICAgICAgMSAgICAgIDEzNTcxICAgIDY5NDg0
MzQKICAtIERpciAgIGRub2RlOiAgICAzODk0NSAgICAzODk0NSAgICAzODk0NSAgICAgICAgIDE1
ICAgICAgIDM4MjggICAgMTk2NzI4MAogIC0gRmlsZSAgZG5vZGU6ICAgIDI2MDgzICAgIDI2MDgz
ICAgIDI2MDgzICAgICAgICAgMjUgICAgICAzODgyNyAgIDE5ODkxODE1CiAgLSBJbmRpciBub2Rl
czogICAgMzIwMzUgICAgMzIwMzUgICAgMzIwMzUgICAgICAgICAgMSAgICAgICAgIDU2ICAgICAg
MjkwODAKICAtIFBpbm5lZCBmaWxlOiAgICAgICAtMSAgICAgICAtMSAgICAgICAtMQogIC0gQVRH
QyAgIGRhdGE6ICAgICAgIC0xICAgICAgIC0xICAgICAgIC0xCgogIC0gVmFsaWQ6IDM5NDkzMAog
IC0gRGlydHk6IDQyCiAgLSBQcmVmcmVlOiAwCiAgLSBGcmVlOiA4MDU3NiAoODA1NzYpCgpDUCBj
YWxsczogMjUwNyAoQkc6IDkwNzcpCiAgLSBjcCBibG9ja3MgOiAxNzc1NgogIC0gc2l0IGJsb2Nr
cyA6IDEyNDI3CiAgLSBuYXQgYmxvY2tzIDogOTIzMzgKICAtIHNzYSBibG9ja3MgOiA4NzM2CkNQ
IG1lcmdlOgogIC0gUXVldWVkIDogICAgMAogIC0gSXNzdWVkIDogOTA5MQogIC0gVG90YWwgOiA5
MDkxCiAgLSBDdXIgdGltZSA6ICAgIDAobXMpCiAgLSBQZWFrIHRpbWUgOiAxMDk1KG1zKQpHQyBj
YWxsczogMjE5MiAoQkc6IDg4MzMpCiAgLSBkYXRhIHNlZ21lbnRzIDogNzgxICg3ODEpCiAgLSBu
b2RlIHNlZ21lbnRzIDogMTQxMSAoMTQxMSkKICAtIFJlY2xhaW1lZCBzZWdzIDoKICAgIC0gTm9y
bWFsIDogMjE5MgogICAgLSBJZGxlIENCIDogMAogICAgLSBJZGxlIEdyZWVkeSA6IDAKICAgIC0g
SWRsZSBBVCA6IDAKICAgIC0gVXJnZW50IEhpZ2ggOiAwCiAgICAtIFVyZ2VudCBNaWQgOiAwCiAg
ICAtIFVyZ2VudCBMb3cgOiAwClRyeSB0byBtb3ZlIDgxNjM0MyBibG9ja3MgKEJHOiA4MTYzNDMp
CiAgLSBkYXRhIGJsb2NrcyA6IDI0MTUzOSAoMjQxNTM5KQogIC0gbm9kZSBibG9ja3MgOiA1NzQ4
MDQgKDU3NDgwNCkKQkcgc2tpcCA6IElPOiA2NSwgT3RoZXI6IDAKCkV4dGVudCBDYWNoZSAoUmVh
ZCk6CiAgLSBIaXQgQ291bnQ6IEwxLTE6MTU0OTg5IEwxLTI6MTYyMzg1IEwyOjQ0NAogIC0gSGl0
IFJhdGlvOiA2NCUgKDMxNzgxOCAvIDQ5NTI3MCkKICAtIElubmVyIFN0cnVjdCBDb3VudDogdHJl
ZTogMzgxMTgoMCksIG5vZGU6IDY2MQoKRXh0ZW50IENhY2hlIChCbG9jayBBZ2UpOgogIC0gQWxs
b2NhdGVkIERhdGEgQmxvY2tzOiAzNDQ3MDk3CiAgLSBIaXQgQ291bnQ6IEwxOjAgTDI6MAogIC0g
SGl0IFJhdGlvOiAwJSAoMCAvIDApCiAgLSBJbm5lciBTdHJ1Y3QgQ291bnQ6IHRyZWU6IDAoMCks
IG5vZGU6IDAKCkJhbGFuY2luZyBGMkZTIEFzeW5jOgogIC0gRElPIChSOiAgICAwLCBXOiAgICAw
KQogIC0gSU9fUiAoRGF0YTogICAgMCwgTm9kZTogICAgMCwgTWV0YTogICAgMAogIC0gSU9fVyAo
Q1A6ICAgIDAsIERhdGE6ICAgIDAsIEZsdXNoOiAoICAgMCAgICAwICAgIDEpLCBEaXNjYXJkOiAo
CjAgMjU1NDUpKSBjbWQ6ICAgIDAgdW5kaXNjYXJkOiAgIDAKICAtIGF0b21pYyBJTzogICAgMCAo
TWF4LiAgICAwKQogIC0gY29tcHJlc3M6ICAgIDAsIGhpdDogICAgICAgMAogIC0gbm9kZXM6ICAg
IDAgaW4gMTE0MTUxCiAgLSBkZW50czogICAgMCBpbiBkaXJzOiAgIDAgKCAgIDApCiAgLSBkYXRh
czogICAgMCBpbiBmaWxlczogICAwCiAgLSBxdW90YSBkYXRhczogICAgMCBpbiBxdW90YSBmaWxl
czogICAwCiAgLSBtZXRhOiAgICAwIGluIDMxODEwCiAgLSBpbWV0YTogICAgMAogIC0gZnN5bmMg
bWFyazogICAgMAogIC0gTkFUczogICAgICAgICAwLyAgICA5OTU3MQogIC0gU0lUczogICAgICAg
ICAwLyAgIDQ3NTU0OAogIC0gZnJlZV9uaWRzOiAgICAgMTA1NTcvIDI2ODAwNDYyCiAgLSBhbGxv
Y19uaWRzOiAgICAgICAgIDAKCkRpc3RyaWJ1dGlvbiBvZiBVc2VyIEJsb2NrczogWyB2YWxpZCB8
IGludmFsaWQgfCBmcmVlIF0KICBbLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS18LXwtLS0tLS0tLV0KCklQVTogNTUgYmxvY2tzClNTUjogMCBibG9ja3MgaW4gMCBzZWdt
ZW50cwpMRlM6IDQ0NzM5ODcgYmxvY2tzIGluIDg3MzYgc2VnbWVudHMKCkJERjogOTksIGF2Zy4g
dmJsb2NrczogNDgwCgpNZW1vcnk6IDcwNTk2NyBLQgogIC0gc3RhdGljOiAxMTU0MzQgS0IKICAt
IGNhY2hlZCBhbGw6IDY2ODkgS0IKICAtIHJlYWQgZXh0ZW50IGNhY2hlOiAzMzIyIEtCCiAgLSBi
bG9jayBhZ2UgZXh0ZW50IGNhY2hlOiAwIEtCCiAgLSBwYWdlZCA6IDU4Mzg0NCBLQgoKPT09PT1b
IHBhcnRpdGlvbiBpbmZvKG52bWUxbjFwMykuICMwLCBSVywgQ1A6IEdvb2RdPT09PT0KW1NCSTog
ZnNfZGlydHkgcmVjb3ZlcmVkXQpbU0I6IDFdIFtDUDogMl0gW1NJVDogNjhdIFtOQVQ6IDUyXSBb
U1NBOiAxODYxXSBbTUFJTjoKOTUwODMwKE92ZXJQcm92OjI3NjUgUmVzdjoxMzQxKV0KCkN1cnJl
bnQgVGltZSBTZWM6IDU0MTAgLyBNb3VudGVkIFRpbWUgU2VjOiA0CgpVdGlsaXphdGlvbjogMjIl
ICgxMDg2NTI5MjkgdmFsaWQgYmxvY2tzLCAzNjI0MjA2MDUgZGlzY2FyZCBibG9ja3MpCiAgLSBO
b2RlOiA1NjI5MzQ4IChJbm9kZTogNTU0MjkwOSwgT3RoZXI6IDg2NDM5KQogIC0gRGF0YTogMTAz
MDIzNTgxCiAgLSBJbmxpbmVfeGF0dHIgSW5vZGU6IDY1NTc1MgogIC0gSW5saW5lX2RhdGEgSW5v
ZGU6IDI1OTkwMAogIC0gSW5saW5lX2RlbnRyeSBJbm9kZTogMTkzMDAwCiAgLSBDb21wcmVzc2Vk
IElub2RlOiAwLCBCbG9ja3M6IDAKICAtIFN3YXBmaWxlIElub2RlOiAwCiAgLSBPcnBoYW4vQXBw
ZW5kL1VwZGF0ZSBJbm9kZTogNTIsIDAsIDAKCk1haW4gYXJlYTogOTUwODMwIHNlZ3MsIDk1MDgz
MCBzZWNzIDk1MDgzMCB6b25lcwogICAgVFlQRSAgICAgICAgICAgIHNlZ25vICAgIHNlY25vICAg
em9uZW5vICBkaXJ0eV9zZWcgICBmdWxsX3NlZyAgdmFsaWRfYmxrCiAgLSBDT0xEICAgZGF0YTog
ICAyOTI1OTcgICAyOTI1OTcgICAyOTI1OTcgICAgICAgIDEyOCAgICAgIDUwMTM5ICAgMjU3MTgz
NTQKICAtIFdBUk0gICBkYXRhOiAgIDY4NTM4NSAgIDY4NTM4NSAgIDY4NTM4NSAgICAgICA4OTM3
ICAgICAxNDIxNzMgICA3NDU5MTA1MAogIC0gSE9UICAgIGRhdGE6ICAgIDIxMjkxICAgIDIxMjkx
ICAgIDIxMjkxICAgICAgIDEzNzIgICAgICAgNDMzMiAgICAyNjg5MDI1CiAgLSBEaXIgICBkbm9k
ZTogICAgMjM0NzEgICAgMjM0NzEgICAgMjM0NzEgICAgICAgMTA0MSAgICAgICAgMTEwICAgICA0
NzY0NzAKICAtIEZpbGUgIGRub2RlOiAgICAyMTI1NSAgICAyMTI1NSAgICAyMTI1NSAgICAgIDEx
MDIxICAgICAgIDM1MDcgICAgNTE0OTE5NAogIC0gSW5kaXIgbm9kZXM6ICAgIDIyODc1ICAgIDIy
ODc1ICAgIDIyODc1ICAgICAgICAgNDAgICAgICAgICAgMSAgICAgICAzNjgzCiAgLSBQaW5uZWQg
ZmlsZTogICAgICAgLTEgICAgICAgLTEgICAgICAgLTEKICAtIEFUR0MgICBkYXRhOiAgICAgICAt
MSAgICAgICAtMSAgICAgICAtMQoKICAtIFZhbGlkOiAyMDAyNjgKICAtIERpcnR5OiAyMjUzMwog
IC0gUHJlZnJlZTogMAogIC0gRnJlZTogNzI4MDI5ICg3MjgwMjkpCgpDUCBjYWxsczogMTczNiAo
Qkc6IDI2NjQpCiAgLSBjcCBibG9ja3MgOiA4ODIxCiAgLSBzaXQgYmxvY2tzIDogMTI0ODEKICAt
IG5hdCBibG9ja3MgOiAyOTc2MQogIC0gc3NhIGJsb2NrcyA6IDMxMDcwCkNQIG1lcmdlOgogIC0g
UXVldWVkIDogICAgMAogIC0gSXNzdWVkIDogMzI4MAogIC0gVG90YWwgOiAzMzUwCiAgLSBDdXIg
dGltZSA6ICAgIDAobXMpCiAgLSBQZWFrIHRpbWUgOiAgIDYxKG1zKQpHQyBjYWxsczogMCAoQkc6
IDApCiAgLSBkYXRhIHNlZ21lbnRzIDogMCAoMCkKICAtIG5vZGUgc2VnbWVudHMgOiAwICgwKQog
IC0gUmVjbGFpbWVkIHNlZ3MgOgogICAgLSBOb3JtYWwgOiAwCiAgICAtIElkbGUgQ0IgOiAwCiAg
ICAtIElkbGUgR3JlZWR5IDogMAogICAgLSBJZGxlIEFUIDogMAogICAgLSBVcmdlbnQgSGlnaCA6
IDAKICAgIC0gVXJnZW50IE1pZCA6IDAKICAgIC0gVXJnZW50IExvdyA6IDAKVHJ5IHRvIG1vdmUg
MCBibG9ja3MgKEJHOiAwKQogIC0gZGF0YSBibG9ja3MgOiAwICgwKQogIC0gbm9kZSBibG9ja3Mg
OiAwICgwKQpCRyBza2lwIDogSU86IDg4LCBPdGhlcjogMAoKRXh0ZW50IENhY2hlIChSZWFkKToK
ICAtIEhpdCBDb3VudDogTDEtMToxNjMzODEgTDEtMjozODI4IEwyOjI5NTYKICAtIEhpdCBSYXRp
bzogMiUgKDE3MDE2NSAvIDcxNjg1MzMpCiAgLSBJbm5lciBTdHJ1Y3QgQ291bnQ6IHRyZWU6IDQ1
MzAyNSgwKSwgbm9kZTogMTkzNzI3CgpFeHRlbnQgQ2FjaGUgKEJsb2NrIEFnZSk6CiAgLSBBbGxv
Y2F0ZWQgRGF0YSBCbG9ja3M6IDE1MjI3OTUwCiAgLSBIaXQgQ291bnQ6IEwxOjAgTDI6MAogIC0g
SGl0IFJhdGlvOiAwJSAoMCAvIDApCiAgLSBJbm5lciBTdHJ1Y3QgQ291bnQ6IHRyZWU6IDAoMCks
IG5vZGU6IDAKCkJhbGFuY2luZyBGMkZTIEFzeW5jOgogIC0gRElPIChSOiAgICAwLCBXOiAgICAw
KQogIC0gSU9fUiAoRGF0YTogICAgMCwgTm9kZTogICAgMCwgTWV0YTogICAgMAogIC0gSU9fVyAo
Q1A6ICAgIDAsIERhdGE6ICAgIDAsIEZsdXNoOiAoICAgMCAzOTIwICAgIDEpLCBEaXNjYXJkOiAo
CjAgIDU1MCkpIGNtZDogMjMxMTcgdW5kaXNjYXJkOjE1NjQ5NjU0CiAgLSBhdG9taWMgSU86ICAg
IDAgKE1heC4gICAgMikKICAtIGNvbXByZXNzOiAgICAwLCBoaXQ6ICAgICAgIDAKICAtIG5vZGVz
OiAgIDUyIGluIDEyMDA1NTQKICAtIGRlbnRzOiAgICA0IGluIGRpcnM6ICAgMSAoICAxNikKICAt
IGRhdGFzOiAxNzk2IGluIGZpbGVzOiAgIDAKICAtIHF1b3RhIGRhdGFzOiAgICAwIGluIHF1b3Rh
IGZpbGVzOiAgIDAKICAtIG1ldGE6ICAgIDIgaW4gNjM4OTgKICAtIGltZXRhOiAgICA5CiAgLSBm
c3luYyBtYXJrOiAgICA1CiAgLSBOQVRzOiAgICAgICAgMTgvICAgIDk5NTgzCiAgLSBTSVRzOiAg
ICAgICAgOTAvICAgOTUwODMwCiAgLSBmcmVlX25pZHM6ICAgIDQyNzU5Ny8gICA0Mjc1OTcKICAt
IGFsbG9jX25pZHM6ICAgICAgICAgMAoKRGlzdHJpYnV0aW9uIG9mIFVzZXIgQmxvY2tzOiBbIHZh
bGlkIHwgaW52YWxpZCB8IGZyZWUgXQogIFstLS0tLS0tLS0tLXwtfC0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tXQoKSVBVOiA3ODgzIGJsb2NrcwpTU1I6IDAgYmxvY2tzIGlu
IDAgc2VnbWVudHMKTEZTOiAxNTkwNzk2NSBibG9ja3MgaW4gMzEwNzAgc2VnbWVudHMKCkJERjog
OTgsIGF2Zy4gdmJsb2NrczogMjcwCgpNZW1vcnk6IDUzNDM3NjAgS0IKICAtIHN0YXRpYzogMjE3
NzI2IEtCCiAgLSBjYWNoZWQgYWxsOiA2ODIyNSBLQgogIC0gcmVhZCBleHRlbnQgY2FjaGU6IDUy
NTUzIEtCCiAgLSBibG9jayBhZ2UgZXh0ZW50IGNhY2hlOiAwIEtCCiAgLSBwYWdlZCA6IDUwNTc4
MDggS0IKCj09PT09WyBwYXJ0aXRpb24gaW5mbyhzZGEyMCkuICMwLCBSVywgQ1A6IEdvb2RdPT09
PT0KW1NCSTogZnNfZGlydHkgcmVjb3ZlcmVkIHF1b3RhX25lZWRfZmx1c2hdCltTQjogMV0gW0NQ
OiAyXSBbU0lUOiA4XSBbTkFUOiAxMTJdIFtTU0E6IDE4MF0gW01BSU46CjkxODU3KE92ZXJQcm92
Ojg2MiBSZXN2OjQzMyldCgpDdXJyZW50IFRpbWUgU2VjOiA3NzQ4MzUgLyBNb3VudGVkIFRpbWUg
U2VjOiAzCgpQb2xpY3k6CiAgLSBJUFU6IFsgRlNZTkMgXQoKVXRpbGl6YXRpb246IDc5JSAoMzcw
NDgzODkgdmFsaWQgYmxvY2tzLCA0MzAgZGlzY2FyZCBibG9ja3MpCiAgLSBOb2RlOiA3MTk0MjIg
KElub2RlOiA2OTc3MjIsIE90aGVyOiAyMTcwMCkKICAtIERhdGE6IDM2MzI4OTY3CiAgLSBJbmxp
bmVfeGF0dHIgSW5vZGU6IDQ0NTIwNAogIC0gSW5saW5lX2RhdGEgSW5vZGU6IDE5NTIzMwogIC0g
SW5saW5lX2RlbnRyeSBJbm9kZTogNTE4NzkKICAtIENvbXByZXNzZWQgSW5vZGU6IDAsIEJsb2Nr
czogMAogIC0gU3dhcGZpbGUgSW5vZGU6IDAKICAtIE9ycGhhbi9BcHBlbmQvVXBkYXRlIElub2Rl
OiAzNjgsIDAsIDAKCk1haW4gYXJlYTogOTE4NTcgc2VncywgOTE4NTcgc2VjcyA5MTg1NyB6b25l
cwogICAgVFlQRSAgICAgICAgICAgIHNlZ25vICAgIHNlY25vICAgem9uZW5vICBkaXJ0eV9zZWcg
ICBmdWxsX3NlZyAgdmFsaWRfYmxrCiAgLSBDT0xEICAgZGF0YTogICAgOTEyNjQgICAgOTEyNjQg
ICAgOTEyNjQgICAgICAgMTg5MyAgICAgIDQyODIyICAgMjI3MjY0OTAKICAtIFdBUk0gICBkYXRh
OiAgICAgODQyNCAgICAgODQyNCAgICAgODQyNCAgICAgICAgNzY2ICAgICAgMjUwMzcgICAxMjkw
OTE5MAogIC0gSE9UICAgIGRhdGE6ICAgICA3NDUzICAgICA3NDUzICAgICA3NDUzICAgICAgICA1
MzggICAgICAgMTI4MiAgICAgNjkyOTgwCiAgLSBEaXIgICBkbm9kZTogICAgIDgzNzIgICAgIDgz
NzIgICAgIDgzNzIgICAgICAgIDE5MiAgICAgICAgMTExICAgICAxMTEwNzYKICAtIEZpbGUgIGRu
b2RlOiAgICAgODA1MSAgICAgODA1MSAgICAgODA1MSAgICAgICAxMzA5ICAgICAgICAzOTMgICAg
IDYwODI1OQogIC0gSW5kaXIgbm9kZXM6ICAgICAgMjU2ICAgICAgMjU2ICAgICAgMjU2ICAgICAg
ICAgIDEgICAgICAgICAgMCAgICAgICAgIDg1CiAgLSBQaW5uZWQgZmlsZTogICAgICAgLTEgICAg
ICAgLTEgICAgICAgLTEKICAtIEFUR0MgICBkYXRhOiAgICAgICAtMSAgICAgICAtMSAgICAgICAt
MQoKICAtIFZhbGlkOiA2OTY1MQogIC0gRGlydHk6IDQ2OTMKICAtIFByZWZyZWU6IDAKICAtIEZy
ZWU6IDE3NTEzICgxNzUxMykKCkNQIGNhbGxzOiAxMzA5NDIgKEJHOiAyMTgxKQogIC0gY3AgYmxv
Y2tzIDogNjYyMTE5CiAgLSBzaXQgYmxvY2tzIDogODc0ODY5CiAgLSBuYXQgYmxvY2tzIDogMzA0
MzUyNwogIC0gc3NhIGJsb2NrcyA6IDEzNjk0MQpDUCBtZXJnZToKICAtIFF1ZXVlZCA6ICAgIDAK
ICAtIElzc3VlZCA6IDEzNDM2MAogIC0gVG90YWwgOiAxMzQ4MDYKICAtIEN1ciB0aW1lIDogICAy
MihtcykKICAtIFBlYWsgdGltZSA6ICA1MjUobXMpCkdDIGNhbGxzOiAzMDQyNSAoQkc6IDMwNDU1
KQogIC0gZGF0YSBzZWdtZW50cyA6IDIxMzIxICgyMTMyMSkKICAtIG5vZGUgc2VnbWVudHMgOiA5
MTA0ICg5MTA0KQogIC0gUmVjbGFpbWVkIHNlZ3MgOgogICAgLSBOb3JtYWwgOiA0MTcKICAgIC0g
SWRsZSBDQiA6IDAKICAgIC0gSWRsZSBHcmVlZHkgOiAwCiAgICAtIElkbGUgQVQgOiAwCiAgICAt
IFVyZ2VudCBIaWdoIDogMzAwMDgKICAgIC0gVXJnZW50IE1pZCA6IDAKICAgIC0gVXJnZW50IExv
dyA6IDAKVHJ5IHRvIG1vdmUgMzI1NzkzNiBibG9ja3MgKEJHOiAzMjU3OTM2KQogIC0gZGF0YSBi
bG9ja3MgOiAyNDcwMzc4ICgyNDcwMzc4KQogIC0gbm9kZSBibG9ja3MgOiA3ODc1NTggKDc4NzU1
OCkKQkcgc2tpcCA6IElPOiA3NTc3LCBPdGhlcjogMzY5NTMKCkV4dGVudCBDYWNoZSAoUmVhZCk6
CiAgLSBIaXQgQ291bnQ6IEwxLTE6MTM2ODA3NDAgTDEtMjo5MDc2ODYgTDI6NDUwNzQ5CiAgLSBI
aXQgUmF0aW86IDE0JSAoMTUwMzkxNzUgLyAxMDU4MzkyOTEpCiAgLSBJbm5lciBTdHJ1Y3QgQ291
bnQ6IHRyZWU6IDM2OTQyNygwKSwgbm9kZTogNDQ3CgpFeHRlbnQgQ2FjaGUgKEJsb2NrIEFnZSk6
CiAgLSBBbGxvY2F0ZWQgRGF0YSBCbG9ja3M6IDM2NTY3MDU1CiAgLSBIaXQgQ291bnQ6IEwxOjAg
TDI6MAogIC0gSGl0IFJhdGlvOiAwJSAoMCAvIDApCiAgLSBJbm5lciBTdHJ1Y3QgQ291bnQ6IHRy
ZWU6IDAoMCksIG5vZGU6IDAKCkJhbGFuY2luZyBGMkZTIEFzeW5jOgogIC0gRElPIChSOiAgICAw
LCBXOiAgICAwKQogIC0gSU9fUiAoRGF0YTogICAgMCwgTm9kZTogICAgMCwgTWV0YTogICAgMAog
IC0gSU9fVyAoQ1A6ICAgIDAsIERhdGE6ICAgIDAsIEZsdXNoOiAoICAgMCAgICAwICAgIDEpLCBE
aXNjYXJkOiAoCjAgNDA2NTE3KSkgY21kOiAyODU2NSB1bmRpc2NhcmQ6MTEwMTI3CiAgLSBhdG9t
aWMgSU86ICAgIDAgKE1heC4gICAgOCkKICAtIGNvbXByZXNzOiAgICAwLCBoaXQ6ICAgICAgIDAK
ICAtIG5vZGVzOiAgICA2IGluIDI5MTQKICAtIGRlbnRzOiAgICAxIGluIGRpcnM6ICAgMSAoICA0
MykKICAtIGRhdGFzOiAgNTA1IGluIGZpbGVzOiAgIDAKICAtIHF1b3RhIGRhdGFzOiAgICAxIGlu
IHF1b3RhIGZpbGVzOiAgIDMKICAtIG1ldGE6ICAgIDAgaW4gIDcxNAogIC0gaW1ldGE6ICAgIDYK
ICAtIGZzeW5jIG1hcms6ICAgIDUKICAtIE5BVHM6ICAgICAgICAxMi8gICAgMzE0MTgKICAtIFNJ
VHM6ICAgICAgICAgNy8gICAgOTE4NTcKICAtIGZyZWVfbmlkczogICAgIDEwOTAyLyAxMjMyNjMz
MAogIC0gYWxsb2NfbmlkczogICAgICAgICAwCgpEaXN0cmlidXRpb24gb2YgVXNlciBCbG9ja3M6
IFsgdmFsaWQgfCBpbnZhbGlkIHwgZnJlZSBdCiAgWy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLXwtLXwtLS0tLS0tLS1dCgpJUFU6IDMwNTU0ODggYmxvY2tzClNTUjogMTg4
MTAwMCBibG9ja3MgaW4gNTI3NjQgc2VnbWVudHMKTEZTOiA0MTIzMzAzMCBibG9ja3MgaW4gODA1
MzIgc2VnbWVudHMKCkJERjogOTgsIGF2Zy4gdmJsb2NrczogMjk1CgpNZW1vcnk6IDczNTIzIEtC
CiAgLSBzdGF0aWM6IDIyODUzIEtCCiAgLSBjYWNoZWQgYWxsOiAzNjE1OCBLQgogIC0gcmVhZCBl
eHRlbnQgY2FjaGU6IDMxNzc5IEtCCiAgLSBibG9jayBhZ2UgZXh0ZW50IGNhY2hlOiAwIEtCCiAg
LSBwYWdlZCA6IDE0NTEyIEtCCgpUaGFua3MsCgo+IFRoYW5rcywKPgo+ID4KPiA+IFRoaXMgd2Fz
IGEgbGVuZ3RoeSBlbWFpbCwgYnV0IEkgaG9wZSBJIHdhcyBiZWluZyByZWFzb25hYmxlLgo+ID4K
PiA+IEphZWdldWsgYW5kIENoYW8sIGxldCBtZSBrbm93IHdoYXQgeW91IHRoaW5rLgo+ID4gQW5k
IGFzIGFsd2F5cywgdGhhbmtzIGZvciB5b3VyIGhhcmQgd29yayA6KQo+ID4KPiA+IFRoYW5rcywK
PiA+IHJlZ2FyZHMKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3Rz
LnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0
aW5mby9saW51eC1mMmZzLWRldmVsCg==
