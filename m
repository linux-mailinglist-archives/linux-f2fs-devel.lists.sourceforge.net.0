Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 95C7FCC678B
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 17 Dec 2025 09:03:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nJdlRZ4/dHl5mdLzGaGaHOUVEKy0q9AiFFwHPVYwRVs=; b=EBXwyqrCDJhg5wIeeQRXhCfQon
	QCSPfiLyClsMJwTb1FJkSEfG++TQ+xr0/kRUshHP8fsBVLl0b3D6V+a/pnUc7wDOfhEPwF7hb5g47
	0TbK3sdQ+6PA0yN+GAFxTw9dNbJ0H9dTOJTp3rxJlMNx7ADQgzdY3GKIOxLC9LhEkmS0=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vVmVe-0007Mu-O4;
	Wed, 17 Dec 2025 08:03:46 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vVmVb-0007M2-OU
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 17 Dec 2025 08:03:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gWi7ObpL/x5ULYix9A9z3dhzQ+nLScow2mHP35UWQ+U=; b=dK5EjTx2e/U4t9QIPqgYUgbfBA
 Z9vMj3+ZhXRTprNWsosfouM1sTmLKKtJ2NbPOcxavU87X5U2nA+FCrW0OijuX21gpNxwbVNEvK6SU
 tTqv6Fv4Jac47M1Jwj3iH8eXVImPLMUECZO8KpxlVW3WgabBT8pB41S5DfM6sxGkwGUc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=gWi7ObpL/x5ULYix9A9z3dhzQ+nLScow2mHP35UWQ+U=; b=EtBW6EAEHX8R6h8Wz529vkDOdo
 qu6cCeMxxCHFtt2Vr/YfyP8E6kRezJ4mDH95BktosYi6c7q1tqSj2/kfWV513YqIY3JkYMG7hFJRt
 ZIvuAz8HT0G3tYqnigPlXDN2+54y7VQgCjaHiWXwjEuX+6ZLV7Lt+m8e/BOwqZGqQxJI=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vVmVa-0005Yy-VL for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 17 Dec 2025 08:03:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 4954B6018C;
 Wed, 17 Dec 2025 08:03:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5DBEC4CEF5;
 Wed, 17 Dec 2025 08:03:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1765958612;
 bh=nwYN6mfsYPWZwbPbiMDPXqHErTa/3LHWzTi1bo0ce+o=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=nCY7kReUW/CenHdEeGnAUeTmWK0Lgsg9K+k7V7pOjEdPTZkDHHquHTfD98Yqz3YsG
 qYPyHJa56cbuYPgDshIMDTdFhe69IAJVxVvPpCWWFPPVxWrIorebkTj5f9nwWLWbvs
 nNmQZAPP/NxDTc4dg8BmAiy912p3gQwiJ/jw3nya6wLS06cZrpjfkQcY7lAoJ8Nm2G
 TJ6UkiaPIl7pPjuyar52XwMo2hV6CNZIotdkgJ9Ll92DYpGYW0ypXsYvwD1VfKzG/K
 y/M1NXp46dtUfSbGlcBNdEGdtxt7cDLF4UrV4DC601ZLCQ40UMNs6DBIn1jp16Fb9F
 V2Yp0FGLjxbdw==
Message-ID: <6483577e-7455-4531-a33f-90b6541d8e42@kernel.org>
Date: Wed, 17 Dec 2025 16:03:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Zhiguo Niu <niuzhiguo84@gmail.com>
References: <20251215122830.3495475-1-chao@kernel.org>
 <CAHJ8P3JECzewfv-JF69r7pvbt6gz++JBDPvFt2GXXwQ+RsCoTw@mail.gmail.com>
 <83a27ae7-ecc2-4d0d-8fb6-5841ed78b5eb@kernel.org>
 <CAHJ8P3JGz89k9XSjkZquZGgXdXOtWMymG34u9rqR7muAzBSUNA@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAHJ8P3JGz89k9XSjkZquZGgXdXOtWMymG34u9rqR7muAzBSUNA@mail.gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "sfi-spamd-2.hosts.colo.sdot.me",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 12/17/25 09:46, Zhiguo Niu wrote: > Chao Yu <chao@kernel.org>
    于2025年12月16日周二 16:49写道： >> >> On 12/16/25 09:36, Zhiguo
    Niu wrote: >>> Chao Yu via Linux-f2fs-devel <linux-f2fs-devel [...] 
 
 Content analysis details:   (-0.2 points, 5.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from author's
                             domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vVmVa-0005Yy-VL
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to sanity check on nat_entry.nid
 in f2fs_get_node_info()
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 stable@kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMTIvMTcvMjUgMDk6NDYsIFpoaWd1byBOaXUgd3JvdGU6Cj4gQ2hhbyBZdSA8Y2hhb0BrZXJu
ZWwub3JnPiDkuo4yMDI15bm0MTLmnIgxNuaXpeWRqOS6jCAxNjo0OeWGmemBk++8mgo+Pgo+PiBP
biAxMi8xNi8yNSAwOTozNiwgWmhpZ3VvIE5pdSB3cm90ZToKPj4+IENoYW8gWXUgdmlhIExpbnV4
LWYyZnMtZGV2ZWwgPGxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Pgo+Pj4g
5LqOMjAyNeW5tDEy5pyIMTXml6XlkajkuIAgMjA6MzTlhpnpgZPvvJoKPj4+Pgo+Pj4+IEluIG9y
ZGVyIHRvIGF2b2lkIGxvYWRpbmcgY29ycnVwdGVkIG5hdCBlbnRyeSBmcm9tIGRpc2suCj4+Pj4K
Pj4+PiBDYzogc3RhYmxlQGtlcm5lbC5vcmcKPj4+PiBTaWduZWQtb2ZmLWJ5OiBDaGFvIFl1IDxj
aGFvQGtlcm5lbC5vcmc+Cj4+Pj4gLS0tCj4+Pj4gIGZzL2YyZnMvbm9kZS5jIHwgOSArKysrKy0t
LS0KPj4+PiAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkK
Pj4+Pgo+Pj4+IGRpZmYgLS1naXQgYS9mcy9mMmZzL25vZGUuYyBiL2ZzL2YyZnMvbm9kZS5jCj4+
Pj4gaW5kZXggY2U0NzFlMDMzNzc0Li4xM2M4OGRmZDc5MGQgMTAwNjQ0Cj4+Pj4gLS0tIGEvZnMv
ZjJmcy9ub2RlLmMKPj4+PiArKysgYi9mcy9mMmZzL25vZGUuYwo+Pj4+IEBAIC02MzAsMTQgKzYz
MCwxNSBAQCBpbnQgZjJmc19nZXRfbm9kZV9pbmZvKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwg
bmlkX3QgbmlkLAo+Pj4+ICAgICAgICAgbm9kZV9pbmZvX2Zyb21fcmF3X25hdChuaSwgJm5lKTsK
Pj4+PiAgICAgICAgIGYyZnNfZm9saW9fcHV0KGZvbGlvLCB0cnVlKTsKPj4+PiAgc2FuaXR5X2No
ZWNrOgo+Pj4+IC0gICAgICAgaWYgKF9faXNfdmFsaWRfZGF0YV9ibGthZGRyKG5pLT5ibGtfYWRk
cikgJiYKPj4+PiArICAgICAgIGlmICh1bmxpa2VseShuaS0+bmlkICE9IG5pZCB8fAo+Pj4gSGkg
Q2hhbywKPj4+IChuaS0+bmlkPT1uaWQpIHNob3VsZCBiZSBhbHdheXMgdHJ1ZT8gYmVjYXVzZSB0
aGUgY29kZToKPj4+Cj4+PiBuaS0+ZmxhZyA9IDA7Cj4+PiBuaS0+bmlkID0gbmlkOwo+Pj4gcmV0
cnk6Cj4+PiBvciBhbSBJIG1pc3Npbmcgc29tZXRoaW5nPwo+Pgo+PiBaaGlndW8sCj4+Cj4+IE9o
LCBJIG1heSBtaXNzZWQgc29tZXRoaW5nLCBsZXQncyBpZ25vcmUgdGhpcyBwYXRjaC4KPj4KPj4+
Cj4+Pj4gKyAgICAgICAgICAgICAgIChfX2lzX3ZhbGlkX2RhdGFfYmxrYWRkcihuaS0+YmxrX2Fk
ZHIpICYmCj4+PiBidHcsIElzIGl0IHBvc3NpYmxlIHRvIGRldGVjdCB0aGF0IHNvbWUgdmFsaWQg
TmlkIGVudHJpZXMgY29udGFpbgo+Pj4gaW5jb3JyZWN0IGNvbnRlbnQ/Cj4+PiBzdWNoIGFzICBp
bm8vYmxvY2tfYWRkcj1OVUxMX0FERFIgaW4gbmlkPTQgZW50cnk/Cj4+Cj4+IFNvbWV0aGluZyBs
aWtlIHRoaXM/Cj4+Cj4+IGRpZmYgLS1naXQgYS9mcy9mMmZzL2YyZnMuaCBiL2ZzL2YyZnMvZjJm
cy5oCj4+IGluZGV4IDY1Y2ExYTVlYWE4OC4uYzQ1OGRmOTJiYjBkIDEwMDY0NAo+PiAtLS0gYS9m
cy9mMmZzL2YyZnMuaAo+PiArKysgYi9mcy9mMmZzL2YyZnMuaAo+PiBAQCAtNDkyOCwxNiArNDky
OCwxNiBAQCBzdGF0aWMgaW5saW5lIGJvb2wgaXNfam91cm5hbGxlZF9xdW90YShzdHJ1Y3QgZjJm
c19zYl9pbmZvICpzYmkpCj4+ICAgICAgICAgcmV0dXJuIGZhbHNlOwo+PiAgfQo+Pgo+PiAtc3Rh
dGljIGlubGluZSBib29sIGYyZnNfcXVvdGFfZmlsZShzdHJ1Y3QgaW5vZGUgKmlub2RlKQo+PiAr
c3RhdGljIGlubGluZSBib29sIGYyZnNfcXVvdGFfZmlsZShzdHJ1Y3QgZjJmc19zYl9pbmZvICpz
YmksIG5pZF90IGlubykKPj4gIHsKPj4gICNpZmRlZiBDT05GSUdfUVVPVEEKPj4gICAgICAgICBp
bnQgaTsKPj4KPj4gLSAgICAgICBpZiAoIWYyZnNfc2JfaGFzX3F1b3RhX2lubyhGMkZTX0lfU0Io
aW5vZGUpKSkKPj4gKyAgICAgICBpZiAoIWYyZnNfc2JfaGFzX3F1b3RhX2lubyhzYmkpKQo+PiAg
ICAgICAgICAgICAgICAgcmV0dXJuIGZhbHNlOwo+Pgo+PiAgICAgICAgIGZvciAoaSA9IDA7IGkg
PCBNQVhRVU9UQVM7IGkrKykgewo+PiAtICAgICAgICAgICAgICAgaWYgKGYyZnNfcWZfaW5vKEYy
RlNfSV9TQihpbm9kZSktPnNiLCBpKSA9PSBpbm9kZS0+aV9pbm8pCj4+ICsgICAgICAgICAgICAg
ICBpZiAoZjJmc19xZl9pbm8oc2JpLT5zYiwgaSkgPT0gaW5vKQo+PiAgICAgICAgICAgICAgICAg
ICAgICAgICByZXR1cm4gdHJ1ZTsKPj4gICAgICAgICB9Cj4+ICAjZW5kaWYKPj4gZGlmZiAtLWdp
dCBhL2ZzL2YyZnMvaW5vZGUuYyBiL2ZzL2YyZnMvaW5vZGUuYwo+PiBpbmRleCA5MjFmYjAyYzBm
NDkuLmQxMjcwYjI1YWQ3ZCAxMDA2NDQKPj4gLS0tIGEvZnMvZjJmcy9pbm9kZS5jCj4+ICsrKyBi
L2ZzL2YyZnMvaW5vZGUuYwo+PiBAQCAtNjIxLDcgKzYyMSw3IEBAIG1ha2Vfbm93Ogo+PiAgICAg
ICAgICAgICAgICAgaW5vZGUtPmlfZm9wID0gJmYyZnNfZmlsZV9vcGVyYXRpb25zOwo+PiAgICAg
ICAgICAgICAgICAgaW5vZGUtPmlfbWFwcGluZy0+YV9vcHMgPSAmZjJmc19kYmxvY2tfYW9wczsK
Pj4gICAgICAgICAgICAgICAgIGlmIChJU19JTU1VVEFCTEUoaW5vZGUpICYmICFmMmZzX2NvbXBy
ZXNzZWRfZmlsZShpbm9kZSkgJiYKPj4gLSAgICAgICAgICAgICAgICAgICAhZjJmc19xdW90YV9m
aWxlKGlub2RlKSkKPj4gKyAgICAgICAgICAgICAgICAgICAhZjJmc19xdW90YV9maWxlKHNiaSwg
aW5vZGUtPmlfaW5vKSkKPj4gICAgICAgICAgICAgICAgICAgICAgICAgbWFwcGluZ19zZXRfZm9s
aW9fbWluX29yZGVyKGlub2RlLT5pX21hcHBpbmcsIDApOwo+PiAgICAgICAgIH0gZWxzZSBpZiAo
U19JU0RJUihpbm9kZS0+aV9tb2RlKSkgewo+PiAgICAgICAgICAgICAgICAgaW5vZGUtPmlfb3Ag
PSAmZjJmc19kaXJfaW5vZGVfb3BlcmF0aW9uczsKPj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvbm9k
ZS5jIGIvZnMvZjJmcy9ub2RlLmMKPj4gaW5kZXggN2ZlZWFkNTk1YmE1Li4xMDQ0OGUxMTVlYTAg
MTAwNjQ0Cj4+IC0tLSBhL2ZzL2YyZnMvbm9kZS5jCj4+ICsrKyBiL2ZzL2YyZnMvbm9kZS5jCj4+
IEBAIC02NDMsNiArNjQzLDE3IEBAIHNhbml0eV9jaGVjazoKPj4gICAgICAgICAgICAgICAgIHJl
dHVybiAtRUZTQ09SUlVQVEVEOwo+PiAgICAgICAgIH0KPj4KPiBIaSBDaGFvCj4+ICsgICAgICAg
aWYgKHVubGlrZWx5KGYyZnNfcXVvdGFfZmlsZShzYmksIG5pLT5uaWQpICYmCj4+ICsgICAgICAg
ICAgICAgICBfX2lzX3ZhbGlkX2RhdGFfYmxrYWRkcihuaS0+YmxrX2FkZHIpKSkgewo+ICBfX2lz
X3ZhbGlkX2RhdGFfYmxrYWRkcihuaS0+YmxrX2FkZHIpIC0tPiAhCj4gX19pc192YWxpZF9kYXRh
X2Jsa2FkZHIobmktPmJsa19hZGRyKT8/CgpaaGlndW8sCgpPaCwgeWVzLgoKPj4gKyAgICAgICAg
ICAgICAgIHNldF9zYmlfZmxhZyhzYmksIFNCSV9ORUVEX0ZTQ0spOwo+PiArICAgICAgICAgICAg
ICAgZjJmc19lcnJfcmF0ZWxpbWl0ZWQoc2JpLAo+PiArICAgICAgICAgICAgICAgICAgICAgICAi
ZjJmc19nZXRfbm9kZV9pbmZvIG9mICVwUzogaW5jb25zaXN0ZW50IG5hdCBlbnRyeSBmcm9tIHFm
X2lubywgIgo+PiArICAgICAgICAgICAgICAgICAgICAgICAiaW5vOiV1LCBuaWQ6JXUsIGJsa2Fk
ZHI6JXUsIHZlcjoldSwgZmxhZzoldSIsCj4+ICsgICAgICAgICAgICAgICAgICAgICAgIF9fYnVp
bHRpbl9yZXR1cm5fYWRkcmVzcygwKSwKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgbmktPmlu
bywgbmktPm5pZCwgbmktPmJsa19hZGRyLCBuaS0+dmVyc2lvbiwgbmktPmZsYWcpOwo+PiArICAg
ICAgICAgICAgICAgZjJmc19oYW5kbGVfZXJyb3Ioc2JpLCBFUlJPUl9JTkNPTlNJU1RFTlRfTkFU
KTsKPj4gKyAgICAgICB9Cj4+ICsKPiBJIHRoaW5rIHRoaXMgaXMgb2sgZm9yIHF1b3RhIGZpbGUs
Cj4gYW5kIFRoaXMgaXMgbm90IGVhc3kgdG8gYXBwbHkgdG8gYWxsIGNvbW1vbiBjYXNlcyggbmlk
IGVudHJ5IG5vdCBvbmx5Cj4gZm9yIHF1b3RhKSwgcmlnaHQ/IF5eCgpZZXMsIEkgZ3Vlc3MgcGFy
dGlhbCBvZiB0aGVtIG1heSBiZSBjb21tb24gY2FzZSwgd2hpY2ggbWF5IGhhcHBlbiBpbiByYWNl
CmNvbmRpdGlvbiwgZS5nLiB0cnVuY2F0ZSB2cyByZWFkLgoKVGhhbmtzLAoKPiBUaGFua3MhCj4+
ICAgICAgICAgLyogY2FjaGUgbmF0IGVudHJ5ICovCj4+ICAgICAgICAgaWYgKG5lZWRfY2FjaGUp
Cj4+ICAgICAgICAgICAgICAgICBjYWNoZV9uYXRfZW50cnkoc2JpLCBuaWQsICZuZSk7Cj4+Cj4+
IFRoYW5rcywKPj4KPj4+IFRoYW5rcwo+Pj4+ICAgICAgICAgICAgICAgICAhZjJmc19pc192YWxp
ZF9ibGthZGRyKHNiaSwgbmktPmJsa19hZGRyLAo+Pj4+IC0gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBEQVRBX0dFTkVSSUNfRU5IQU5DRSkpIHsKPj4+PiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgREFUQV9HRU5FUklDX0VOSEFOQ0UpKSkpIHsK
Pj4+PiAgICAgICAgICAgICAgICAgc2V0X3NiaV9mbGFnKHNiaSwgU0JJX05FRURfRlNDSyk7Cj4+
Pj4gICAgICAgICAgICAgICAgIGYyZnNfZXJyX3JhdGVsaW1pdGVkKHNiaSwKPj4+PiAtICAgICAg
ICAgICAgICAgICAgICAgICAiZjJmc19nZXRfbm9kZV9pbmZvIG9mICVwUzogaW5jb25zaXN0ZW50
IG5hdCBlbnRyeSwgIgo+Pj4+ICsgICAgICAgICAgICAgICAgICAgICAgICJmMmZzX2dldF9ub2Rl
X2luZm8gb2YgJXBTOiBuaWQ6JXUsIGluY29uc2lzdGVudCBuYXQgZW50cnksICIKPj4+PiAgICAg
ICAgICAgICAgICAgICAgICAgICAiaW5vOiV1LCBuaWQ6JXUsIGJsa2FkZHI6JXUsIHZlcjoldSwg
ZmxhZzoldSIsCj4+Pj4gLSAgICAgICAgICAgICAgICAgICAgICAgX19idWlsdGluX3JldHVybl9h
ZGRyZXNzKDApLAo+Pj4+ICsgICAgICAgICAgICAgICAgICAgICAgIF9fYnVpbHRpbl9yZXR1cm5f
YWRkcmVzcygwKSwgbmlkLAo+Pj4+ICAgICAgICAgICAgICAgICAgICAgICAgIG5pLT5pbm8sIG5p
LT5uaWQsIG5pLT5ibGtfYWRkciwgbmktPnZlcnNpb24sIG5pLT5mbGFnKTsKPj4+PiAgICAgICAg
ICAgICAgICAgZjJmc19oYW5kbGVfZXJyb3Ioc2JpLCBFUlJPUl9JTkNPTlNJU1RFTlRfTkFUKTsK
Pj4+PiAgICAgICAgICAgICAgICAgcmV0dXJuIC1FRlNDT1JSVVBURUQ7Cj4+Pj4gLS0KPj4+PiAy
LjQ5LjAKPj4+Pgo+Pj4+Cj4+Pj4KPj4+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwo+Pj4+IExpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0Cj4+Pj4g
TGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKPj4+PiBodHRwczovL2xpc3Rz
LnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCj4+CgoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMt
ZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0
Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMt
ZGV2ZWwK
