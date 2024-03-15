Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D6A6F87C751
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 15 Mar 2024 02:47:09 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rkwex-0002Nc-CI;
	Fri, 15 Mar 2024 01:46:59 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <niuzhiguo84@gmail.com>) id 1rkwev-0002NW-Cs
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 15 Mar 2024 01:46:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RK3WS8YU/TIO9C5L+2WMErB8Z6UUjxPHl/ZVfvjJt24=; b=ZHI27H5s0bTvc7SfdZsd8NqqKR
 /XBWwx+qFnKjEeIf/WrKZnZV3nFtyKc3A7ebsiaqka/dHW6VCWlfse+zrs3zG3pdelqWJkb7aPMUv
 YKmQIABxoREs+I1YF+uzoKivJESvqTubF4YvgGFvgCe+Gy7z/ykZHyb/IrMNCHgzv3hI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=RK3WS8YU/TIO9C5L+2WMErB8Z6UUjxPHl/ZVfvjJt24=; b=Ad9bddvmz8rF+1802XtIEmkZ2O
 aTZPBXWSuyBnUok86VAbsD8WwNOR5PRcnls3oVbcw9uB7erL0F8HOCpXh3KUN14Y56AnA/Ll1ct/4
 jpx0SdB2ZRVvuz1qsmOjagNLeCzCU5sDm2jkPW4vh3tXQ1YWXckmtjp7yG0qzxXAadhY=;
Received: from mail-lj1-f169.google.com ([209.85.208.169])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rkwek-0001ik-3J for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 15 Mar 2024 01:46:57 +0000
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-2d4541bf57eso20323371fa.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 14 Mar 2024 18:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710467200; x=1711072000; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RK3WS8YU/TIO9C5L+2WMErB8Z6UUjxPHl/ZVfvjJt24=;
 b=b4dR7WHgV9OVW/3tMraookfWxU9nOgGGjrgyyf27FYkMDujmen5DLpnTcigf6hnvL3
 VkS2m5OD+HzJPCwwkFPj5LcuyxVIi9/GdaUca3laSPORjL088ZTI2xM0Yfc2HYcRELWk
 kGhAVC9lkcEZaiFuRCMjS3MbGrbdS2oq7qqrj9Uj6KOSI7lMYuMHpjdnvkbDIlRQTXIU
 AdXmUGOPzYSwY2z4XH/3U1S0s/ZR64VoVvh43Siy8veveSQbX+4vepOp3pghwxwXgeqb
 +MvNg9cFhlerFD+qEHzAPjVMExO7BmZJJFLt90/tQSFsRoe3ZYfeO0+31JSkIf54ZK1Q
 DVzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710467200; x=1711072000;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RK3WS8YU/TIO9C5L+2WMErB8Z6UUjxPHl/ZVfvjJt24=;
 b=YjDBJzux+KggCmDc+Pvl+oSnLgpRHvmKO5RPOgeAvMO6fbtZtD5ybzlxocCURnp6VX
 u1lN4LNKDAk8ouLLFGjsFeSdlcenl6cx8EsxTKKPQgO1lMRp0cvGMix3ZUXb0kNGEDDB
 mkm151bg/MYq9a3WCG3pWK50HhYPMmt8BwVHDBiHxSh9JVgBkNANMAYXUeps/6FOpQ0P
 XdHvx/Iu67hYaGqDtYd+AXJT/ao4hgU5zLkSsL9tPT9PohAFpM1c1xAQYwaxK40rnzyO
 1AFB0Voa/JyIo4MXYtyfPEzMcBmjNbMg0jIWA3R8RGkFUrwZL04tyKEFmrt11zFl7dpK
 CL4A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVobZTZf9zpaGvOX94+VTgZDIdFZKHgtUnkXyoGtg9AP0aO6QR12U4O/Xw+Bt60YDN1tCE7t8DXr4JX/oYfrF7bsklePa43zKddXu5NDz2RsVyxQyXnyQ==
X-Gm-Message-State: AOJu0YwCX/LHL6VFReRQX101uOxTXxH/+DG7g+lo9wuWwJ0t33pfbkZG
 XjXCB4DI7Eig5FuX7jRomnPYoZFgS+Ju4NT+F+FjqAt8TMctXzEXZO3KYWkFBqExHzSjzRl03Lb
 wzG6fgCXHjHkXMy8xVtOAaFFkc0rlYF43WOazQA==
X-Google-Smtp-Source: AGHT+IErr3X67ESANY5oZyQc3OQLFn3z4WEmx0f2jrHn04v+Ur73VCVeriymLwGz/734BKBZHnJAHIsYO4kZAqD4yqs=
X-Received: by 2002:a05:651c:32a:b0:2d4:3c64:53f5 with SMTP id
 b10-20020a05651c032a00b002d43c6453f5mr1972795ljp.19.1710467200055; Thu, 14
 Mar 2024 18:46:40 -0700 (PDT)
MIME-Version: 1.0
References: <1710303061-16822-1-git-send-email-zhiguo.niu@unisoc.com>
 <eeefebcb-54db-4087-9319-dd5f9b63a1da@kernel.org>
In-Reply-To: <eeefebcb-54db-4087-9319-dd5f9b63a1da@kernel.org>
From: Zhiguo Niu <niuzhiguo84@gmail.com>
Date: Fri, 15 Mar 2024 09:46:28 +0800
Message-ID: <CAHJ8P3+mo+yT8wfv2Xd3Rb7sFtXufmOgh_6CLzZxM5CjtYWC2Q@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Thu, Mar 14, 2024 at 9:06 PM Chao Yu wrote: > > On 2024/3/13
    12:11, Zhiguo Niu wrote: > > some user behaviors requested filesystem operations,
    which > > will cause filesystem not idle. > > Mean [...] 
 
 Content analysis details:   (0.0 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [niuzhiguo84[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
                             in digit
                             [niuzhiguo84[at]gmail.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.208.169 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.208.169 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rkwek-0001ik-3J
Subject: Re: [f2fs-dev] [PATCH] f2fs: add REQ_TIME time update for some user
 behaviors
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
Cc: ke.wang@unisoc.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, hongyu.jin@unisoc.com,
 Zhiguo Niu <zhiguo.niu@unisoc.com>, jaegeuk@kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gVGh1LCBNYXIgMTQsIDIwMjQgYXQgOTowNuKAr1BNIENoYW8gWXUgPGNoYW9Aa2VybmVsLm9y
Zz4gd3JvdGU6Cj4KPiBPbiAyMDI0LzMvMTMgMTI6MTEsIFpoaWd1byBOaXUgd3JvdGU6Cj4gPiBz
b21lIHVzZXIgYmVoYXZpb3JzIHJlcXVlc3RlZCBmaWxlc3lzdGVtIG9wZXJhdGlvbnMsIHdoaWNo
Cj4gPiB3aWxsIGNhdXNlIGZpbGVzeXN0ZW0gbm90IGlkbGUuCj4gPiBNZWFud2hpbGUgYWRqdXN0
IGYyZnNfdXBkYXRlX3RpbWUoUkVRX1RJTUUpIG9mCj4gPiBmMmZzX2lvY19kZWZyYWdtZW50IHRv
IHN1Y2Nlc3NmdWwgY2FzZS4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBaaGlndW8gTml1IDx6aGln
dW8ubml1QHVuaXNvYy5jb20+Cj4gPiAtLS0KPiA+ICAgZnMvZjJmcy9maWxlLmMgfCA5ICsrKysr
KysrLQo+ID4gICAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0p
Cj4gPgo+ID4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvZmlsZS5jIGIvZnMvZjJmcy9maWxlLmMKPiA+
IGluZGV4IDRkZmUzOGUuLmRhYzM4MzYgMTAwNjQ0Cj4gPiAtLS0gYS9mcy9mMmZzL2ZpbGUuYwo+
ID4gKysrIGIvZnMvZjJmcy9maWxlLmMKPiA+IEBAIC0yNzg0LDcgKzI3ODQsNiBAQCBzdGF0aWMg
aW50IGYyZnNfaW9jX2RlZnJhZ21lbnQoc3RydWN0IGZpbGUgKmZpbHAsIHVuc2lnbmVkIGxvbmcg
YXJnKQo+ID4gICAgICAgZXJyID0gZjJmc19kZWZyYWdtZW50X3JhbmdlKHNiaSwgZmlscCwgJnJh
bmdlKTsKPiA+ICAgICAgIG1udF9kcm9wX3dyaXRlX2ZpbGUoZmlscCk7Cj4gPgo+ID4gLSAgICAg
ZjJmc191cGRhdGVfdGltZShzYmksIFJFUV9USU1FKTsKPgo+IEkgZ3Vlc3Mgd2UgbmVlZCB0byBj
YWxsIGYyZnNfdXBkYXRlX3RpbWUoKSBoZXJlIGlmIGFueSBkYXRhIHdhcwo+IG1pZ3JhdGVkLgpP
SyEKPgo+IGlmIChyYW5nZS0+bGVuKQo+ICAgICAgICAgZjJmc191cGRhdGVfdGltZShzYmksIFJF
UV9USU1FKTsKPgo+ID4gICAgICAgaWYgKGVyciA8IDApCj4gPiAgICAgICAgICAgICAgIHJldHVy
biBlcnI7Cj4gPgo+ID4gQEAgLTI3OTIsNiArMjc5MSw3IEBAIHN0YXRpYyBpbnQgZjJmc19pb2Nf
ZGVmcmFnbWVudChzdHJ1Y3QgZmlsZSAqZmlscCwgdW5zaWduZWQgbG9uZyBhcmcpCj4gPiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzaXplb2Yo
cmFuZ2UpKSkKPiA+ICAgICAgICAgICAgICAgcmV0dXJuIC1FRkFVTFQ7Cj4gPgo+ID4gKyAgICAg
ZjJmc191cGRhdGVfdGltZShzYmksIFJFUV9USU1FKTsKPiA+ICAgICAgIHJldHVybiAwOwo+ID4g
ICB9Cj4gPgo+ID4gQEAgLTMzMzEsNiArMzMzMSw3IEBAIHN0YXRpYyBpbnQgZjJmc19pb2NfcmVz
aXplX2ZzKHN0cnVjdCBmaWxlICpmaWxwLCB1bnNpZ25lZCBsb25nIGFyZykKPiA+ICAgICAgIGlm
IChjb3B5X2Zyb21fdXNlcigmYmxvY2tfY291bnQsICh2b2lkIF9fdXNlciAqKWFyZywKPiA+ICAg
ICAgICAgICAgICAgICAgICAgICAgICBzaXplb2YoYmxvY2tfY291bnQpKSkKPiA+ICAgICAgICAg
ICAgICAgcmV0dXJuIC1FRkFVTFQ7Cj4gPiArICAgICBmMmZzX3VwZGF0ZV90aW1lKHNiaSwgUkVR
X1RJTUUpOwo+Cj4gVGhlcmUgd2lsbCBiZSBubyBmdXJ0aGVyIElPIGluIHRoZSBlbmQgb2YgZjJm
c19pb2NfcmVzaXplX2ZzKCksIHNvIHdlIGRvbid0Cj4gbmVlZCB0byB1cGRhdGUgdGltZSB0byBk
ZWxheSBnYy9kaXNjYXJkIHRocmVhZD8KPgo+ID4KPiA+ICAgICAgIHJldHVybiBmMmZzX3Jlc2l6
ZV9mcyhmaWxwLCBibG9ja19jb3VudCk7Cj4gPiAgIH0KPiA+IEBAIC0zNDI0LDYgKzM0MjUsNyBA
QCBzdGF0aWMgaW50IGYyZnNfaW9jX3NldGZzbGFiZWwoc3RydWN0IGZpbGUgKmZpbHAsIHVuc2ln
bmVkIGxvbmcgYXJnKQo+ID4gICAgICAgZjJmc191cF93cml0ZSgmc2JpLT5zYl9sb2NrKTsKPiA+
Cj4gPiAgICAgICBtbnRfZHJvcF93cml0ZV9maWxlKGZpbHApOwo+ID4gKyAgICAgZjJmc191cGRh
dGVfdGltZShzYmksIFJFUV9USU1FKTsKPgo+IERpdHRvLApEZWFyIENoYW8sCgpUaGUgdHdvIHBh
cnRzIHlvdSBwcm9wb3NlZCBzaG91bGQgYmUgc2ltaWxhciB0byB0aGUgYmVsb3cgc2NlbmFyaW8/
Ci0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LQpzdGF0aWMgaW50IGYyZnNfaW9jX3NldF9lbmNyeXB0aW9uX3BvbGljeShzdHJ1Y3QgZmlsZSAq
ZmlscCwgdW5zaWduZWQgbG9uZyBhcmcpCnsKc3RydWN0IGlub2RlICppbm9kZSA9IGZpbGVfaW5v
ZGUoZmlscCk7CgppZiAoIWYyZnNfc2JfaGFzX2VuY3J5cHQoRjJGU19JX1NCKGlub2RlKSkpCnJl
dHVybiAtRU9QTk9UU1VQUDsKCmYyZnNfdXBkYXRlX3RpbWUoRjJGU19JX1NCKGlub2RlKSwgUkVR
X1RJTUUpOwoKcmV0dXJuIGZzY3J5cHRfaW9jdGxfc2V0X3BvbGljeShmaWxwLCAoY29uc3Qgdm9p
ZCBfX3VzZXIgKilhcmcpOwp9Ci0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tCnRoYW5rcyEKCgo+Cj4gVGhhbmtzLAo+Cj4gPiAgIG91dDoK
PiA+ICAgICAgIGtmcmVlKHZidWYpOwo+ID4gICAgICAgcmV0dXJuIGVycjsKPiA+IEBAIC0zNTk3
LDYgKzM1OTksNyBAQCBzdGF0aWMgaW50IGYyZnNfcmVsZWFzZV9jb21wcmVzc19ibG9ja3Moc3Ry
dWN0IGZpbGUgKmZpbHAsIHVuc2lnbmVkIGxvbmcgYXJnKQo+ID4KPiA+ICAgICAgIGZpbGVtYXBf
aW52YWxpZGF0ZV91bmxvY2soaW5vZGUtPmlfbWFwcGluZyk7Cj4gPiAgICAgICBmMmZzX3VwX3dy
aXRlKCZGMkZTX0koaW5vZGUpLT5pX2djX3J3c2VtW1dSSVRFXSk7Cj4gPiArICAgICBmMmZzX3Vw
ZGF0ZV90aW1lKHNiaSwgUkVRX1RJTUUpOwo+ID4gICBvdXQ6Cj4gPiAgICAgICBpbm9kZV91bmxv
Y2soaW5vZGUpOwo+ID4KPiA+IEBAIC0zNzY2LDYgKzM3NjksNyBAQCBzdGF0aWMgaW50IGYyZnNf
cmVzZXJ2ZV9jb21wcmVzc19ibG9ja3Moc3RydWN0IGZpbGUgKmZpbHAsIHVuc2lnbmVkIGxvbmcg
YXJnKQo+ID4gICAgICAgICAgICAgICBjbGVhcl9pbm9kZV9mbGFnKGlub2RlLCBGSV9DT01QUkVT
U19SRUxFQVNFRCk7Cj4gPiAgICAgICAgICAgICAgIGlub2RlX3NldF9jdGltZV9jdXJyZW50KGlu
b2RlKTsKPiA+ICAgICAgICAgICAgICAgZjJmc19tYXJrX2lub2RlX2RpcnR5X3N5bmMoaW5vZGUs
IHRydWUpOwo+ID4gKyAgICAgICAgICAgICBmMmZzX3VwZGF0ZV90aW1lKHNiaSwgUkVRX1RJTUUp
Owo+ID4gICAgICAgfQo+ID4gICB1bmxvY2tfaW5vZGU6Cj4gPiAgICAgICBpbm9kZV91bmxvY2so
aW5vZGUpOwo+ID4gQEAgLTM5NjQsNiArMzk2OCw3IEBAIHN0YXRpYyBpbnQgZjJmc19zZWNfdHJp
bV9maWxlKHN0cnVjdCBmaWxlICpmaWxwLCB1bnNpZ25lZCBsb25nIGFyZykKPiA+ICAgICAgIGlm
IChsZW4pCj4gPiAgICAgICAgICAgICAgIHJldCA9IGYyZnNfc2VjdXJlX2VyYXNlKHByZXZfYmRl
diwgaW5vZGUsIHByZXZfaW5kZXgsCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBw
cmV2X2Jsb2NrLCBsZW4sIHJhbmdlLmZsYWdzKTsKPiA+ICsgICAgIGYyZnNfdXBkYXRlX3RpbWUo
c2JpLCBSRVFfVElNRSk7Cj4gPiAgIG91dDoKPiA+ICAgICAgIGZpbGVtYXBfaW52YWxpZGF0ZV91
bmxvY2sobWFwcGluZyk7Cj4gPiAgICAgICBmMmZzX3VwX3dyaXRlKCZGMkZTX0koaW5vZGUpLT5p
X2djX3J3c2VtW1dSSVRFXSk7Cj4gPiBAQCAtNDE3Myw2ICs0MTc4LDcgQEAgc3RhdGljIGludCBm
MmZzX2lvY19kZWNvbXByZXNzX2ZpbGUoc3RydWN0IGZpbGUgKmZpbHApCj4gPiAgICAgICBpZiAo
cmV0KQo+ID4gICAgICAgICAgICAgICBmMmZzX3dhcm4oc2JpLCAiJXM6IFRoZSBmaWxlIG1pZ2h0
IGJlIHBhcnRpYWxseSBkZWNvbXByZXNzZWQgKGVycm5vPSVkKS4gUGxlYXNlIGRlbGV0ZSB0aGUg
ZmlsZS4iLAo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgX19mdW5jX18sIHJldCk7Cj4gPiAr
ICAgICBmMmZzX3VwZGF0ZV90aW1lKHNiaSwgUkVRX1RJTUUpOwo+ID4gICBvdXQ6Cj4gPiAgICAg
ICBpbm9kZV91bmxvY2soaW5vZGUpOwo+ID4gICAgICAgZmlsZV9lbmRfd3JpdGUoZmlscCk7Cj4g
PiBAQCAtNDI1Miw2ICs0MjU4LDcgQEAgc3RhdGljIGludCBmMmZzX2lvY19jb21wcmVzc19maWxl
KHN0cnVjdCBmaWxlICpmaWxwKQo+ID4gICAgICAgaWYgKHJldCkKPiA+ICAgICAgICAgICAgICAg
ZjJmc193YXJuKHNiaSwgIiVzOiBUaGUgZmlsZSBtaWdodCBiZSBwYXJ0aWFsbHkgY29tcHJlc3Nl
ZCAoZXJybm89JWQpLiBQbGVhc2UgZGVsZXRlIHRoZSBmaWxlLiIsCj4gPiAgICAgICAgICAgICAg
ICAgICAgICAgICBfX2Z1bmNfXywgcmV0KTsKPiA+ICsgICAgIGYyZnNfdXBkYXRlX3RpbWUoc2Jp
LCBSRVFfVElNRSk7Cj4gPiAgIG91dDoKPiA+ICAgICAgIGlub2RlX3VubG9jayhpbm9kZSk7Cj4g
PiAgICAgICBmaWxlX2VuZF93cml0ZShmaWxwKTsKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51
eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZv
cmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
