Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 17964CC1A53
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 16 Dec 2025 09:49:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+REIJQDa9+gkXKEAxStvib1K/f9g13B525Dn4RHGVuA=; b=PaHqeqcqmW+k3yfRk6rFZh6YIp
	RoaZNpPLUopHB8bLKcpj2ebbdjWB2iioS+LiKBVgjzDv6tab+JanX/26Nb3nnsaoj16g3J+uU2B8f
	KlwxnCoz5xkCkpbONvEZTeKjIfm/Y+1Cd9TCsrtl2fNovNN5vfo902rO6CvGfTQyLedo=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vVQkH-00072T-TI;
	Tue, 16 Dec 2025 08:49:26 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vVQkG-00072D-Bc
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 16 Dec 2025 08:49:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sFbzqzp1eM1gSjqZP6lsDZccyHn0hqQG0d/iBSABwuM=; b=l0OXmPyFVBoLB73WJAfI3quOuR
 YCRqbQo/F+h2LS+beT4OO1ydc/53oRBnAZkjVTYileQnhXXd/M6A/PWS6htr9Mf13r97cNRE+M7LY
 UdAgu5qcB9fQaNdmXJ0Z0p2Qq+AChrkof7RIrNSEdfwxXV8M3x81uI1H4H0yegI2fXzY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=sFbzqzp1eM1gSjqZP6lsDZccyHn0hqQG0d/iBSABwuM=; b=glHMHuAx8x+/3fYZv29K/8qfnU
 XWP6wgF+WGAZEoCdJRbqyt38FToxPJmS/FJKOCkxvMTY0zk9h52I4vvbd64rDnkmAaCVg3Jbl5E2N
 7B3C2poVaNwKE76bSdtg0VFr8I4a1tlfpE6z7TSzdyDz0FTWyt9rDmBiLuW6vkT0BgSY=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vVQkG-0002Y6-Jo for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 16 Dec 2025 08:49:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 36CED43925;
 Tue, 16 Dec 2025 08:49:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C817C4CEF1;
 Tue, 16 Dec 2025 08:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1765874954;
 bh=yGcWNrUC6laWMqnP0hRjOhJFA+KrzsQU7jBiNtXlJ1E=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=kTxRdQOjxc41iu45epHgfWSYcWd8Qh4ShboMgTUJwDbuj2mnko3cdns6AzES5ApLw
 NPowsrHztEnb3CUvpjnoFjSHP4O2Rf8YyFWWRPFA5QOvVqMqDG1yuM/RhePOTdj0x/
 VBSu8dUBGZop1yU6/lJYhYvn09U8+6osK1ghDVeb+jcUeXjpO4CZK5n46t1uNKmdCV
 FdO5NxNT7wE7ibLwPjELSyZD2WpmHjHrNa4UQkXFfWsCAJfES2D46ZRE6FxuiI0tnj
 WTmC0uv70kVU/AvX23CPyDy/NDEq+Jqs94H6njmd9xIJ8YiAShMvFlpsmLkU13GrhX
 n1d50PJFvJY7g==
Message-ID: <83a27ae7-ecc2-4d0d-8fb6-5841ed78b5eb@kernel.org>
Date: Tue, 16 Dec 2025 16:49:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Zhiguo Niu <niuzhiguo84@gmail.com>
References: <20251215122830.3495475-1-chao@kernel.org>
 <CAHJ8P3JECzewfv-JF69r7pvbt6gz++JBDPvFt2GXXwQ+RsCoTw@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAHJ8P3JECzewfv-JF69r7pvbt6gz++JBDPvFt2GXXwQ+RsCoTw@mail.gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "sfi-spamd-1.hosts.colo.sdot.me",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 12/16/25 09:36, Zhiguo Niu wrote: > Chao Yu via Linux-f2fs-devel
    <linux-f2fs-devel@lists.sourceforge.net> > 于2025年12月15日周一 20:34写道：
    >> >> In order to avoid loading corrupted nat e [...] 
 
 Content analysis details:   (-0.2 points, 5.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily valid
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from author's
                             domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vVQkG-0002Y6-Jo
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

T24gMTIvMTYvMjUgMDk6MzYsIFpoaWd1byBOaXUgd3JvdGU6Cj4gQ2hhbyBZdSB2aWEgTGludXgt
ZjJmcy1kZXZlbCA8bGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQ+Cj4g5LqO
MjAyNeW5tDEy5pyIMTXml6XlkajkuIAgMjA6MzTlhpnpgZPvvJoKPj4KPj4gSW4gb3JkZXIgdG8g
YXZvaWQgbG9hZGluZyBjb3JydXB0ZWQgbmF0IGVudHJ5IGZyb20gZGlzay4KPj4KPj4gQ2M6IHN0
YWJsZUBrZXJuZWwub3JnCj4+IFNpZ25lZC1vZmYtYnk6IENoYW8gWXUgPGNoYW9Aa2VybmVsLm9y
Zz4KPj4gLS0tCj4+ICBmcy9mMmZzL25vZGUuYyB8IDkgKysrKystLS0tCj4+ICAxIGZpbGUgY2hh
bmdlZCwgNSBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEv
ZnMvZjJmcy9ub2RlLmMgYi9mcy9mMmZzL25vZGUuYwo+PiBpbmRleCBjZTQ3MWUwMzM3NzQuLjEz
Yzg4ZGZkNzkwZCAxMDA2NDQKPj4gLS0tIGEvZnMvZjJmcy9ub2RlLmMKPj4gKysrIGIvZnMvZjJm
cy9ub2RlLmMKPj4gQEAgLTYzMCwxNCArNjMwLDE1IEBAIGludCBmMmZzX2dldF9ub2RlX2luZm8o
c3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLCBuaWRfdCBuaWQsCj4+ICAgICAgICAgbm9kZV9pbmZv
X2Zyb21fcmF3X25hdChuaSwgJm5lKTsKPj4gICAgICAgICBmMmZzX2ZvbGlvX3B1dChmb2xpbywg
dHJ1ZSk7Cj4+ICBzYW5pdHlfY2hlY2s6Cj4+IC0gICAgICAgaWYgKF9faXNfdmFsaWRfZGF0YV9i
bGthZGRyKG5pLT5ibGtfYWRkcikgJiYKPj4gKyAgICAgICBpZiAodW5saWtlbHkobmktPm5pZCAh
PSBuaWQgfHwKPiBIaSBDaGFvLAo+IChuaS0+bmlkPT1uaWQpIHNob3VsZCBiZSBhbHdheXMgdHJ1
ZT8gYmVjYXVzZSB0aGUgY29kZToKPiAKPiBuaS0+ZmxhZyA9IDA7Cj4gbmktPm5pZCA9IG5pZDsK
PiByZXRyeToKPiBvciBhbSBJIG1pc3Npbmcgc29tZXRoaW5nPwoKWmhpZ3VvLAoKT2gsIEkgbWF5
IG1pc3NlZCBzb21ldGhpbmcsIGxldCdzIGlnbm9yZSB0aGlzIHBhdGNoLgoKPiAKPj4gKyAgICAg
ICAgICAgICAgIChfX2lzX3ZhbGlkX2RhdGFfYmxrYWRkcihuaS0+YmxrX2FkZHIpICYmCj4gYnR3
LCBJcyBpdCBwb3NzaWJsZSB0byBkZXRlY3QgdGhhdCBzb21lIHZhbGlkIE5pZCBlbnRyaWVzIGNv
bnRhaW4KPiBpbmNvcnJlY3QgY29udGVudD8KPiBzdWNoIGFzICBpbm8vYmxvY2tfYWRkcj1OVUxM
X0FERFIgaW4gbmlkPTQgZW50cnk/CgpTb21ldGhpbmcgbGlrZSB0aGlzPwoKZGlmZiAtLWdpdCBh
L2ZzL2YyZnMvZjJmcy5oIGIvZnMvZjJmcy9mMmZzLmgKaW5kZXggNjVjYTFhNWVhYTg4Li5jNDU4
ZGY5MmJiMGQgMTAwNjQ0Ci0tLSBhL2ZzL2YyZnMvZjJmcy5oCisrKyBiL2ZzL2YyZnMvZjJmcy5o
CkBAIC00OTI4LDE2ICs0OTI4LDE2IEBAIHN0YXRpYyBpbmxpbmUgYm9vbCBpc19qb3VybmFsbGVk
X3F1b3RhKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSkKIAlyZXR1cm4gZmFsc2U7CiB9Cgotc3Rh
dGljIGlubGluZSBib29sIGYyZnNfcXVvdGFfZmlsZShzdHJ1Y3QgaW5vZGUgKmlub2RlKQorc3Rh
dGljIGlubGluZSBib29sIGYyZnNfcXVvdGFfZmlsZShzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmks
IG5pZF90IGlubykKIHsKICNpZmRlZiBDT05GSUdfUVVPVEEKIAlpbnQgaTsKCi0JaWYgKCFmMmZz
X3NiX2hhc19xdW90YV9pbm8oRjJGU19JX1NCKGlub2RlKSkpCisJaWYgKCFmMmZzX3NiX2hhc19x
dW90YV9pbm8oc2JpKSkKIAkJcmV0dXJuIGZhbHNlOwoKIAlmb3IgKGkgPSAwOyBpIDwgTUFYUVVP
VEFTOyBpKyspIHsKLQkJaWYgKGYyZnNfcWZfaW5vKEYyRlNfSV9TQihpbm9kZSktPnNiLCBpKSA9
PSBpbm9kZS0+aV9pbm8pCisJCWlmIChmMmZzX3FmX2lubyhzYmktPnNiLCBpKSA9PSBpbm8pCiAJ
CQlyZXR1cm4gdHJ1ZTsKIAl9CiAjZW5kaWYKZGlmZiAtLWdpdCBhL2ZzL2YyZnMvaW5vZGUuYyBi
L2ZzL2YyZnMvaW5vZGUuYwppbmRleCA5MjFmYjAyYzBmNDkuLmQxMjcwYjI1YWQ3ZCAxMDA2NDQK
LS0tIGEvZnMvZjJmcy9pbm9kZS5jCisrKyBiL2ZzL2YyZnMvaW5vZGUuYwpAQCAtNjIxLDcgKzYy
MSw3IEBAIG1ha2Vfbm93OgogCQlpbm9kZS0+aV9mb3AgPSAmZjJmc19maWxlX29wZXJhdGlvbnM7
CiAJCWlub2RlLT5pX21hcHBpbmctPmFfb3BzID0gJmYyZnNfZGJsb2NrX2FvcHM7CiAJCWlmIChJ
U19JTU1VVEFCTEUoaW5vZGUpICYmICFmMmZzX2NvbXByZXNzZWRfZmlsZShpbm9kZSkgJiYKLQkJ
ICAgICFmMmZzX3F1b3RhX2ZpbGUoaW5vZGUpKQorCQkgICAgIWYyZnNfcXVvdGFfZmlsZShzYmks
IGlub2RlLT5pX2lubykpCiAJCQltYXBwaW5nX3NldF9mb2xpb19taW5fb3JkZXIoaW5vZGUtPmlf
bWFwcGluZywgMCk7CiAJfSBlbHNlIGlmIChTX0lTRElSKGlub2RlLT5pX21vZGUpKSB7CiAJCWlu
b2RlLT5pX29wID0gJmYyZnNfZGlyX2lub2RlX29wZXJhdGlvbnM7CmRpZmYgLS1naXQgYS9mcy9m
MmZzL25vZGUuYyBiL2ZzL2YyZnMvbm9kZS5jCmluZGV4IDdmZWVhZDU5NWJhNS4uMTA0NDhlMTE1
ZWEwIDEwMDY0NAotLS0gYS9mcy9mMmZzL25vZGUuYworKysgYi9mcy9mMmZzL25vZGUuYwpAQCAt
NjQzLDYgKzY0MywxNyBAQCBzYW5pdHlfY2hlY2s6CiAJCXJldHVybiAtRUZTQ09SUlVQVEVEOwog
CX0KCisJaWYgKHVubGlrZWx5KGYyZnNfcXVvdGFfZmlsZShzYmksIG5pLT5uaWQpICYmCisJCV9f
aXNfdmFsaWRfZGF0YV9ibGthZGRyKG5pLT5ibGtfYWRkcikpKSB7CisJCXNldF9zYmlfZmxhZyhz
YmksIFNCSV9ORUVEX0ZTQ0spOworCQlmMmZzX2Vycl9yYXRlbGltaXRlZChzYmksCisJCQkiZjJm
c19nZXRfbm9kZV9pbmZvIG9mICVwUzogaW5jb25zaXN0ZW50IG5hdCBlbnRyeSBmcm9tIHFmX2lu
bywgIgorCQkJImlubzoldSwgbmlkOiV1LCBibGthZGRyOiV1LCB2ZXI6JXUsIGZsYWc6JXUiLAor
CQkJX19idWlsdGluX3JldHVybl9hZGRyZXNzKDApLAorCQkJbmktPmlubywgbmktPm5pZCwgbmkt
PmJsa19hZGRyLCBuaS0+dmVyc2lvbiwgbmktPmZsYWcpOworCQlmMmZzX2hhbmRsZV9lcnJvcihz
YmksIEVSUk9SX0lOQ09OU0lTVEVOVF9OQVQpOworCX0KKwogCS8qIGNhY2hlIG5hdCBlbnRyeSAq
LwogCWlmIChuZWVkX2NhY2hlKQogCQljYWNoZV9uYXRfZW50cnkoc2JpLCBuaWQsICZuZSk7CgpU
aGFua3MsCgo+IFRoYW5rcwo+PiAgICAgICAgICAgICAgICAgIWYyZnNfaXNfdmFsaWRfYmxrYWRk
cihzYmksIG5pLT5ibGtfYWRkciwKPj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIERBVEFfR0VORVJJQ19FTkhBTkNFKSkgewo+PiArICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgREFUQV9HRU5FUklDX0VOSEFOQ0UpKSkpIHsKPj4gICAgICAgICAg
ICAgICAgIHNldF9zYmlfZmxhZyhzYmksIFNCSV9ORUVEX0ZTQ0spOwo+PiAgICAgICAgICAgICAg
ICAgZjJmc19lcnJfcmF0ZWxpbWl0ZWQoc2JpLAo+PiAtICAgICAgICAgICAgICAgICAgICAgICAi
ZjJmc19nZXRfbm9kZV9pbmZvIG9mICVwUzogaW5jb25zaXN0ZW50IG5hdCBlbnRyeSwgIgo+PiAr
ICAgICAgICAgICAgICAgICAgICAgICAiZjJmc19nZXRfbm9kZV9pbmZvIG9mICVwUzogbmlkOiV1
LCBpbmNvbnNpc3RlbnQgbmF0IGVudHJ5LCAiCj4+ICAgICAgICAgICAgICAgICAgICAgICAgICJp
bm86JXUsIG5pZDoldSwgYmxrYWRkcjoldSwgdmVyOiV1LCBmbGFnOiV1IiwKPj4gLSAgICAgICAg
ICAgICAgICAgICAgICAgX19idWlsdGluX3JldHVybl9hZGRyZXNzKDApLAo+PiArICAgICAgICAg
ICAgICAgICAgICAgICBfX2J1aWx0aW5fcmV0dXJuX2FkZHJlc3MoMCksIG5pZCwKPj4gICAgICAg
ICAgICAgICAgICAgICAgICAgbmktPmlubywgbmktPm5pZCwgbmktPmJsa19hZGRyLCBuaS0+dmVy
c2lvbiwgbmktPmZsYWcpOwo+PiAgICAgICAgICAgICAgICAgZjJmc19oYW5kbGVfZXJyb3Ioc2Jp
LCBFUlJPUl9JTkNPTlNJU1RFTlRfTkFUKTsKPj4gICAgICAgICAgICAgICAgIHJldHVybiAtRUZT
Q09SUlVQVEVEOwo+PiAtLQo+PiAyLjQ5LjAKPj4KPj4KPj4KPj4gX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPj4gTGludXgtZjJmcy1kZXZlbCBtYWlsaW5n
IGxpc3QKPj4gTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKPj4gaHR0cHM6
Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAoK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1m
MmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdl
Lm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1m
MmZzLWRldmVsCg==
