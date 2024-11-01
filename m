Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AEE29B8C87
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  1 Nov 2024 09:01:30 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t6mau-00028A-4Z;
	Fri, 01 Nov 2024 08:01:20 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <niuzhiguo84@gmail.com>) id 1t6mas-000283-UC
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 01 Nov 2024 08:01:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=l3wFiCMxWX4GMGR14s8fXyG7FhtI29ey/QfMb0SZKcs=; b=PBHh5GHDYWSA7sKkldFmMSw1v6
 L0t287czhj2b/dX9BAzqvxaqWlTpYnHDzZyarJDTB9x6NWnJGFp9TBUS3fp+LvhQHrPv+ZV/Ipekg
 j5B5QzaM9JJn59M/tJ8exKA5oSSfKU4BvNBRyONJz1SlrO949sWqcZhalsyJ/vYSMyAc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=l3wFiCMxWX4GMGR14s8fXyG7FhtI29ey/QfMb0SZKcs=; b=QakCKiThimY7/GMGi33pnoY99h
 5Kblqod3Q3ZAPxWFp/lfULbQrd6XUkzir4UKh9sbuBdHbRT30AG9uRXoGXD/lDvNob8fTICHb4vSl
 A7LjJ1HUXeZvbL2fk/sYA3TTzDV42aZ9vp20ClUemfcRZw26tGLtGCcNZxzXT8rD0qak=;
Received: from mail-wr1-f54.google.com ([209.85.221.54])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1t6mas-0001aA-7d for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 01 Nov 2024 08:01:18 +0000
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-37d4ddd7ac1so128972f8f.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 01 Nov 2024 01:01:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730448067; x=1731052867; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=l3wFiCMxWX4GMGR14s8fXyG7FhtI29ey/QfMb0SZKcs=;
 b=A24eAr7Z/eLeOtn8F9kQ3zX1NnFti920RkZQG8x1/mYJXRYzQEcK4ZcGJVIQ1n/bXo
 l+6qbwxkI6QfuEmx6CE3wvOagKkBa8HLqs1SAEYzjY2+91rV9tJIuAleDGeRKaSEqGYG
 r9VqitQ1P3F6G6GTXGO/PD5VeAKIjjOUEHfEvuuU+voW7P+zaxHhyVT2prpBeiFqe7Hc
 af4wCPPTC0ZSwaQPGEE1gR8vbDmFT3BuGPClmhPNjt7S9T8zzKQ6LDFFSQqaNvRXpnPy
 eV+J3gifs6Vs8MqhFUJNSo5jg/u2OWGf1l7Xk1SzwxiL6cJmG7muAO5b6315+NVPAsOw
 r/9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730448067; x=1731052867;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=l3wFiCMxWX4GMGR14s8fXyG7FhtI29ey/QfMb0SZKcs=;
 b=xL4Um2YMKT57MjDwjQ+ZaB1DHH879oOEqkXWLzAS3wKLpNkQ8sCa4dLl0rQHuYAoq8
 MBE04FQYx2bqDfWytN1PdOpHRNLBb7vCzEy/9CYwhcOF35fNe76aL1vNEYpjJ2I7N9z/
 R5jplkNWWwFjEUR5dFkpKIIBeXm0ZWnwfWXX6+/n7di8SCY+/YRMVaJ6O3P+ZYX/oycf
 Y1dxJm2MeKJJOrl2gCvYBcwiNsWHLmkaq44VuNJH4nsj2AJdxi206xNYT/M4fHikM6HB
 ffq/fxS5najl0RWCgx1xFRcQooK+rdV/TO53QNzs80wA+ZB2vwDRL2Rtwyn2tolCRXug
 3ZqA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU6G5t0IRpWX1GfVrLWoCo3Hart/WVr+E4/5Rl7oqZ0wsONvY8a/dc2tkoQWfghK4zOKvBuBB8ba5X70ohiZZSB@lists.sourceforge.net
X-Gm-Message-State: AOJu0YwWaOnNxpqEt3NSYPPktfnRw1/bBd2/cAeMFgqG3W2UKVEAfYor
 rJXdEQEMVSgligG3lClByfTf9aEKgcaimIo766qW6oUYlznFmIfm3p/PAQ4kXtizNP5ciFBWbD4
 SodaNpYIN5jl0hG0H8fVyxGoFJB8=
X-Google-Smtp-Source: AGHT+IGCxG3PImKp+g5IUNAg285XEzP2peodElZALyBm5qI/sIWRVeAcmENNcln3gyGOmYpyl56Pik8YtMWqAA7by3M=
X-Received: by 2002:a5d:64ef:0:b0:37d:2e83:bc44 with SMTP id
 ffacd0b85a97d-3806124a914mr7254380f8f.9.1730448066387; Fri, 01 Nov 2024
 01:01:06 -0700 (PDT)
MIME-Version: 1.0
References: <1730354393-19672-1-git-send-email-zhiguo.niu@unisoc.com>
 <1730354393-19672-2-git-send-email-zhiguo.niu@unisoc.com>
 <bf348748-46ba-47dd-a12d-5111be2df95e@kernel.org>
In-Reply-To: <bf348748-46ba-47dd-a12d-5111be2df95e@kernel.org>
From: Zhiguo Niu <niuzhiguo84@gmail.com>
Date: Fri, 1 Nov 2024 16:00:55 +0800
Message-ID: <CAHJ8P3LDXj1B9XTfFEqxn-3nZXkKe9cLrWmdTqjCOp62Z+mwtg@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Chao Yu 于2024年11月1日周五 10:36写道： > > On 2024/10/31
    13:59, Zhiguo Niu wrote: > > If user give a file size as "length" parameter
    for fiemap > > operations, but this size is non-block s [...] 
 
 Content analysis details:   (0.1 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [niuzhiguo84[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
                             in digit
                             [niuzhiguo84[at]gmail.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.221.54 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.221.54 listed in wl.mailspike.net]
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
X-Headers-End: 1t6mas-0001aA-7d
Subject: Re: [f2fs-dev] [PATCH 2/2] f2fs: fix to adjust appropriate length
 for fiemap
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
 linux-f2fs-devel@lists.sourceforge.net, Zhiguo Niu <zhiguo.niu@unisoc.com>,
 jaegeuk@kernel.org, Hao_hao.Wang@unisoc.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Q2hhbyBZdSA8Y2hhb0BrZXJuZWwub3JnPiDkuo4yMDI05bm0MTHmnIgx5pel5ZGo5LqUIDEwOjM2
5YaZ6YGT77yaCj4KPiBPbiAyMDI0LzEwLzMxIDEzOjU5LCBaaGlndW8gTml1IHdyb3RlOgo+ID4g
SWYgdXNlciBnaXZlIGEgZmlsZSBzaXplIGFzICJsZW5ndGgiIHBhcmFtZXRlciBmb3IgZmllbWFw
Cj4gPiBvcGVyYXRpb25zLCBidXQgdGhpcyBzaXplIGlzIG5vbi1ibG9jayBzaXplIGFsaWduZWQs
Cj4gPiBpdCB3aWxsIHNob3cgMiBzZWdtZW50cyBmaWVtYXAgcmVzdWx0cyBldmVuIHRoaXMgd2hv
bGUgZmlsZQo+ID4gaXMgY29udGlndW91cyBvbiBkaXNrLCBzdWNoIGFzIHRoZSBmb2xsb3dpbmcg
cmVzdWx0cywgcGxlYXNlCj4gPiBub3RlIHRoYXQgdGhpcyBmMmZzX2lvIGhhcyBiZWVuIG1vZGlm
aWVkIGZvciB0ZXN0aW5nLgo+ID4KPiA+ICAgLi9mMmZzX2lvIGZpZW1hcCAwIDE5MzA0IHlsb2cv
YW5hbHl6ZXIucHkKPiA+IEZpZW1hcDogb2Zmc2V0ID0gMCBsZW4gPSAxOTMwNAo+ID4gICAgICAg
ICAgbG9naWNhbCBhZGRyLiAgICBwaHlzaWNhbCBhZGRyLiAgIGxlbmd0aCAgICAgICAgICAgZmxh
Z3MKPiA+IDAgICAgICAgMDAwMDAwMDAwMDAwMDAwMCAwMDAwMDAwMDIwYmFhMDAwIDAwMDAwMDAw
MDAwMDQwMDAgMDAwMDEwMDAKPiA+IDEgICAgICAgMDAwMDAwMDAwMDAwNDAwMCAwMDAwMDAwMDIw
YmFlMDAwIDAwMDAwMDAwMDAwMDEwMDAgMDAwMDEwMDEKPiA+Cj4gPiBhZnRlciB0aGlzIHBhdGNo
Ogo+ID4gICAuL2YyZnNfaW8gZmllbWFwIDAgMTkzMDQgeWxvZy9hbmFseXplci5weQo+ID4gRmll
bWFwOiBvZmZzZXQgPSAwIGxlbiA9IDE5MzA0Cj4gPiAgICAgICBsb2dpY2FsIGFkZHIuICAgIHBo
eXNpY2FsIGFkZHIuICAgbGVuZ3RoICAgICAgICAgICBmbGFncwo+ID4gMCAgICAgMDAwMDAwMDAw
MDAwMDAwMCAwMDAwMDAwMDMxNWYzMDAwIDAwMDAwMDAwMDAwMDUwMDAgMDAwMDEwMDAKPgo+IFdo
eSBpcyBGSUVNQVBfRVhURU5UX0xBU1QgbWlzc2luZyBpbiAjMCBleHRlbnQ/IEFzIHdlIGNhbiBz
ZWUgaXQKPiBpbiAjMSBleHRlbnQgYmVmb3JlIHlvdXIgY2hhbmdlLgpIaSBDaGFvLAphZnRlciBJ
IGNvbmZpcm0sIHRoaXMgbG9nIGNhbWUgZnJvbSBteSBsb2NhbCBjb2RlIGFuZCB3aXRoIHNvbWUg
b3RoZXIKbW9kaWZpY2F0aW9uLgpBbmQgYWZ0ZXIgSSB1c2UgdGhlIGYyZnMgb3JpZ2luYWwgY29k
ZSB3aXRoIHRoaXMgcGF0Y2ggLCBjYW4gc2VlIHRoZQpGSUVNQVBfRVhURU5UX0xBU1QKaGFzIGJl
ZW4gdGFnZ2VkLCAgdGhlIGZvbGxvd2luZyBpcyB0aGUgZmllbWFwIGxvZy4KCi9mMmZzX2lvIGZp
ZW1hcCAwIDE5MDM0IHlsb2cvYW5hbHl6ZXIucHkgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIDwKRmllbWFwOiBvZmZzZXQgPSAwIGxlbiA9IDE5MDM0CiAgICBsb2dpY2FsIGFk
ZHIuICAgIHBoeXNpY2FsIGFkZHIuICAgbGVuZ3RoICAgICAgICAgICBmbGFncwowICAgIDAwMDAw
MDAwMDAwMDAwMDAgMDAwMDAwMDAzMTVmMzAwMCAwMDAwMDAwMDAwMDA1MDAwIDAwMDAxMDAxCkkg
d2lsbCB1cGRhdGUgdGhlIGNvbW1pdCBtc2cgaW4gdGhlIG5leHQgdmVyc2lvbiBhZnRlciByZXZp
ZXdpbmcuClRoYW5rcyBhIGxvdC4KPgo+IDEgICAgICAgMDAwMDAwMDAwMDAwNDAwMCAwMDAwMDAw
MDIwYmFlMDAwIDAwMDAwMDAwMDAwMDEwMDAgMDAwMDEwMDEKPgo+IFRoYW5rcywKPgo+ID4KPiA+
IFNpZ25lZC1vZmYtYnk6IFpoaWd1byBOaXUgPHpoaWd1by5uaXVAdW5pc29jLmNvbT4KPiA+IC0t
LQo+ID4gZjJmc19pbyBoYXMgYmVlbiBtb2RpZmllZCBmb3IgdGVzdGluZywgdGhlIGxlbmd0aCBm
b3IgZmllbWFwIGlzCj4gPiByZWFsIGZpbGUgc2l6ZSwgbm90IGJsb2NrIG51bWJlcgo+ID4gLS0t
Cj4gPiAgIGZzL2YyZnMvZGF0YS5jIHwgNCArKy0tCj4gPiAgIDEgZmlsZSBjaGFuZ2VkLCAyIGlu
c2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMv
ZGF0YS5jIGIvZnMvZjJmcy9kYXRhLmMKPiA+IGluZGV4IDkwZmE4YWIuLjhjOWJiNDIgMTAwNjQ0
Cj4gPiAtLS0gYS9mcy9mMmZzL2RhdGEuYwo+ID4gKysrIGIvZnMvZjJmcy9kYXRhLmMKPiA+IEBA
IC0xOTY2LDggKzE5NjYsOCBAQCBpbnQgZjJmc19maWVtYXAoc3RydWN0IGlub2RlICppbm9kZSwg
c3RydWN0IGZpZW1hcF9leHRlbnRfaW5mbyAqZmllaW5mbywKPiA+ICAgICAgICAgICAgICAgICAg
ICAgICBnb3RvIG91dDsKPiA+ICAgICAgIH0KPiA+Cj4gPiAtICAgICBpZiAoYnl0ZXNfdG9fYmxr
cyhpbm9kZSwgbGVuKSA9PSAwKQo+ID4gLSAgICAgICAgICAgICBsZW4gPSBibGtzX3RvX2J5dGVz
KGlub2RlLCAxKTsKPiA+ICsgICAgIGlmIChsZW4gJiAoYmxrc190b19ieXRlcyhpbm9kZSwgMSkg
LSAxKSkKPiA+ICsgICAgICAgICAgICAgbGVuID0gcm91bmRfdXAobGVuLCBibGtzX3RvX2J5dGVz
KGlub2RlLCAxKSk7Cj4gPgo+ID4gICAgICAgc3RhcnRfYmxrID0gYnl0ZXNfdG9fYmxrcyhpbm9k
ZSwgc3RhcnQpOwo+ID4gICAgICAgbGFzdF9ibGsgPSBieXRlc190b19ibGtzKGlub2RlLCBzdGFy
dCArIGxlbiAtIDEpOwo+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBs
aXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMv
bGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
