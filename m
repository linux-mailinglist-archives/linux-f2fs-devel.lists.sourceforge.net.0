Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F41AFC08B
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  8 Jul 2025 04:11:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UQTiFRSdtrAZc0REm+L2YasTHZjdcglRHiYaHJznhAw=; b=CWB4N2elt8GVn12Cq67Ai9vM1m
	4Ria/yM68zYQuJ5rTIbckduHwh2l8poUQEB48P1Bgmvg7HC8LvwZJCZ3n4E/UdQZHD/QMbU+DDVPR
	CbjXY8btBZA3DuS1IE3WjpR3uUY/jc/x7VHYi0gnH74aK6c11AvG3VnYUR18KYFP6fx0=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uYxnW-0003bd-Np;
	Tue, 08 Jul 2025 02:11:06 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <quwenruo.btrfs@gmx.com>) id 1uYxme-0003ah-V5
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Jul 2025 02:10:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0h5VDs/ZUqYitD9U3zCLJQXOlFnOTO0lH7VNO4yWm1o=; b=KaBCceiBCwAJHUpn3sBreUS2b/
 q0UaIMDvSjWqGNhQXXZDi6zTR7czAwwfd9isD3hbHl5iVq2sjQ5Pl3vhP0qVtfvyBc5VMEPdFeSJQ
 u0KchWgE6/0ujulZ3UPB+limTrbW+icEz/QmkWwBAqfYZ8p+C7FPTVwb/e/o0+0pDgCY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0h5VDs/ZUqYitD9U3zCLJQXOlFnOTO0lH7VNO4yWm1o=; b=IQMBY42GIQR64o+BTu9v5TpS1s
 2emKwgLWmrumHuMogJUCIhSW5h0QGGX1n3107YSuRU9Umabkp/WBcbDp7M6FrW/mH7/TLupuO9ZJB
 dJUhC36fTNij9oX4di3P1moaeBex7iPb62b8GK7APJsUoyoIMrtHXHOh1gUSXl6iQYo0=;
Received: from mout.gmx.net ([212.227.17.20])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uYxme-0002dh-49 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Jul 2025 02:10:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.com;
 s=s31663417; t=1751940590; x=1752545390; i=quwenruo.btrfs@gmx.com;
 bh=0h5VDs/ZUqYitD9U3zCLJQXOlFnOTO0lH7VNO4yWm1o=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=aFbYN7eXZ1e/aKYoUwoDgU20cCqPFEg5zR7Gs3BrJDK+vrSjkAaL3vqEHxUj37GF
 JHVtFZxu93XEl+GNo5x40+aDuTouonHo6szImifyFO2R5EROwsIt4vA4NyOn6mIMs
 jDaShxYI31H3BZVkROP68nzx3jc5c1OLwUgCZ+qjv+i1Onq3zAU6YKHy8UFiPXWdn
 aMUXokgp+tOHNQHBwg+FtUu9OIxkIsrh/LmuYPD+6JxPcbHDV7teenMsabvoEwJhi
 J2gom3jhhscbBpj68ZgVfQBt09tWMml9IMxnEPhUavS7YpXFpVDgtmx5W8cfUef6F
 oijnnAoHH32HC4XcdQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [172.16.0.229] ([159.196.52.54]) by mail.gmx.net (mrgmx105
 [212.227.17.174]) with ESMTPSA (Nemesis) id 1MyKHc-1urhS546iy-015pS4; Tue, 08
 Jul 2025 04:09:50 +0200
Message-ID: <02584a40-a2c0-4565-ab46-50c1a4100b21@gmx.com>
Date: Tue, 8 Jul 2025 11:39:42 +0930
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Darrick J. Wong" <djwong@kernel.org>
References: <cover.1751589725.git.wqu@suse.com>
 <de25bbdb572c75df38b1002d3779bf19e3ad0ff6.1751589725.git.wqu@suse.com>
 <aGxSHKeyldrR1Q0T@dread.disaster.area>
 <dbd955f7-b9b4-402f-97bf-6b38f0c3237e@gmx.com>
 <20250708004532.GA2672018@frogsfrogsfrogs>
Content-Language: en-US
Autocrypt: addr=quwenruo.btrfs@gmx.com; keydata=
 xsBNBFnVga8BCACyhFP3ExcTIuB73jDIBA/vSoYcTyysFQzPvez64TUSCv1SgXEByR7fju3o
 8RfaWuHCnkkea5luuTZMqfgTXrun2dqNVYDNOV6RIVrc4YuG20yhC1epnV55fJCThqij0MRL
 1NxPKXIlEdHvN0Kov3CtWA+R1iNN0RCeVun7rmOrrjBK573aWC5sgP7YsBOLK79H3tmUtz6b
 9Imuj0ZyEsa76Xg9PX9Hn2myKj1hfWGS+5og9Va4hrwQC8ipjXik6NKR5GDV+hOZkktU81G5
 gkQtGB9jOAYRs86QG/b7PtIlbd3+pppT0gaS+wvwMs8cuNG+Pu6KO1oC4jgdseFLu7NpABEB
 AAHNIlF1IFdlbnJ1byA8cXV3ZW5ydW8uYnRyZnNAZ214LmNvbT7CwJQEEwEIAD4CGwMFCwkI
 BwIGFQgJCgsCBBYCAwECHgECF4AWIQQt33LlpaVbqJ2qQuHCPZHzoSX+qAUCZxF1YAUJEP5a
 sQAKCRDCPZHzoSX+qF+mB/9gXu9C3BV0omDZBDWevJHxpWpOwQ8DxZEbk9b9LcrQlWdhFhyn
 xi+l5lRziV9ZGyYXp7N35a9t7GQJndMCFUWYoEa+1NCuxDs6bslfrCaGEGG/+wd6oIPb85xo
 naxnQ+SQtYLUFbU77WkUPaaIU8hH2BAfn9ZSDX9lIxheQE8ZYGGmo4wYpnN7/hSXALD7+oun
 tZljjGNT1o+/B8WVZtw/YZuCuHgZeaFdhcV2jsz7+iGb+LsqzHuznrXqbyUQgQT9kn8ZYFNW
 7tf+LNxXuwedzRag4fxtR+5GVvJ41Oh/eygp8VqiMAtnFYaSlb9sjia1Mh+m+OBFeuXjgGlG
 VvQFzsBNBFnVga8BCACqU+th4Esy/c8BnvliFAjAfpzhI1wH76FD1MJPmAhA3DnX5JDORcga
 CbPEwhLj1xlwTgpeT+QfDmGJ5B5BlrrQFZVE1fChEjiJvyiSAO4yQPkrPVYTI7Xj34FnscPj
 /IrRUUka68MlHxPtFnAHr25VIuOS41lmYKYNwPNLRz9Ik6DmeTG3WJO2BQRNvXA0pXrJH1fN
 GSsRb+pKEKHKtL1803x71zQxCwLh+zLP1iXHVM5j8gX9zqupigQR/Cel2XPS44zWcDW8r7B0
 q1eW4Jrv0x19p4P923voqn+joIAostyNTUjCeSrUdKth9jcdlam9X2DziA/DHDFfS5eq4fEv
 ABEBAAHCwHwEGAEIACYCGwwWIQQt33LlpaVbqJ2qQuHCPZHzoSX+qAUCZxF1gQUJEP5a0gAK
 CRDCPZHzoSX+qHGpB/kB8A7M7KGL5qzat+jBRoLwB0Y3Zax0QWuANVdZM3eJDlKJKJ4HKzjo
 B2Pcn4JXL2apSan2uJftaMbNQbwotvabLXkE7cPpnppnBq7iovmBw++/d8zQjLQLWInQ5kNq
 Vmi36kmq8o5c0f97QVjMryHlmSlEZ2Wwc1kURAe4lsRG2dNeAd4CAqmTw0cMIrR6R/Dpt3ma
 +8oGXJOmwWuDFKNV4G2XLKcghqrtcRf2zAGNogg3KulCykHHripG3kPKsb7fYVcSQtlt5R6v
 HZStaZBzw4PcDiaAF3pPDBd+0fIKS6BlpeNRSFG94RYrt84Qw77JWDOAZsyNfEIEE0J6LSR/
In-Reply-To: <20250708004532.GA2672018@frogsfrogsfrogs>
X-Provags-ID: V03:K1:LtuoZyNaToYftOWmNW8wynAcLNGgt+BTG26KXfqxGFyysSJQjTY
 dGo/srMDXitMVyTRVSmSOtL1PY7v+HCDDQ5vpZsUIIfbSl6Bs7Rni7glh6FXMu0TjDaxYaQ
 yCqbBIQ0ZYlyLA09sy6wJ03IwRa6XFPsuELICG2CuXtgr7Q/P3Su+/HGfif4SkQZxEd//nI
 KGoR/TiIp7+sEKBCSd/2w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:wZmAZRbajo0=;PNV3xrk5N3151j3iXOadSy+eecD
 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
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "sfi-spamd-1.hosts.colo.sdot.me",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  在 2025/7/8 10:15, Darrick J. Wong 写道: [...] >> >> I
    do not think it's the correct way to go, especially when there is already
    >> fs_holder_ops. >> >> We're always going towards a more generic so [...]
    
 
 Content analysis details:   (-0.2 points, 5.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily valid
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from author's
                             domain
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail provider
                             [quwenruo.btrfs(at)gmx.com]
  0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
                             [212.227.17.20 listed in wl.mailspike.net]
  0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1uYxme-0002dh-49
Subject: Re: [f2fs-dev] [PATCH v4 1/6] fs: enhance and rename shutdown()
 callback to remove_bdev()
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
From: Qu Wenruo via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Qu Wenruo <quwenruo.btrfs@gmx.com>
Cc: brauner@kernel.org, ntfs3@lists.linux.dev, jack@suse.cz,
 Dave Chinner <david@fromorbit.com>, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, Qu Wenruo <wqu@suse.com>,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-btrfs@vger.kernel.org, viro@zeniv.linux.org.uk
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

CgrlnKggMjAyNS83LzggMTA6MTUsIERhcnJpY2sgSi4gV29uZyDlhpnpgZM6ClsuLi5dCj4+Cj4+
IEkgZG8gbm90IHRoaW5rIGl0J3MgdGhlIGNvcnJlY3Qgd2F5IHRvIGdvLCBlc3BlY2lhbGx5IHdo
ZW4gdGhlcmUgaXMgYWxyZWFkeQo+PiBmc19ob2xkZXJfb3BzLgo+Pgo+PiBXZSdyZSBhbHdheXMg
Z29pbmcgdG93YXJkcyBhIG1vcmUgZ2VuZXJpYyBzb2x1dGlvbiwgb3RoZXIgdGhhbiBsZXR0aW5n
IHRoZQo+PiBpbmRpdmlkdWFsIGZzIHRvIGRvIHRoZSBzYW1lIHRoaW5nIHNsaWdodGx5IGRpZmZl
cmVudGx5Lgo+IAo+IE9uIHNlY29uZCB0aG91Z2h0IC0tIGl0J3Mgd2VpcmQgdGhhdCB5b3UnZCBm
bHVzaCB0aGUgZmlsZXN5c3RlbSBhbmQKPiBzaHJpbmsgdGhlIGlub2RlL2RlbnRyeSBjYWNoZXMg
aW4gYSAieW91ciBkZXZpY2Ugd2VudCBhd2F5IiBoYW5kbGVyLgo+IEZhbmN5IGZpbGVzeXN0ZW1z
IGxpa2UgYmNhY2hlZnMgYW5kIGJ0cmZzIHdvdWxkIGxpa2VseSBqdXN0IHNoaWZ0IElPIHRvCj4g
YSBkaWZmZXJlbnQgYmRldiwgcmlnaHQ/ICBBbmQgdGhlcmUncyBubyBnb29kIHJlYXNvbiB0byBy
dW4gc2hyaW5rZXJzIG9uCj4gZWl0aGVyIG9mIHRob3NlIGZzZXMsIHJpZ2h0PwoKVGhhdCdzIHJp
Z2h0LCBzb21lIHBhcnQgb2YgZnNfYmRldl9tYXJrX2RlYWQoKSBpcyBub3QgbWFraW5nIG11Y2gg
c2Vuc2UgCmlmIHRoZSBmcyBjYW4gaGFuZGxlIHRoZSBkZXYgbG9zcy4KCj4gCj4+IFllcywgdGhl
IG5hbWluZyBpcyBub3QgcGVyZmVjdCBhbmQgbWl4aW5nIGNhdXNlIGFuZCBhY3Rpb24sIGJ1dCB0
aGUgZW5kCj4+IHJlc3VsdCBpcyBzdGlsbCBhIG1vcmUgZ2VuZXJpYyBhbmQgbGVzcyBkdXBsaWNh
dGVkIGNvZGUgYmFzZS4KPiAKPiBJIHRoaW5rIGRjaGlubmVyIG1ha2VzIGEgZ29vZCBwb2ludCB0
aGF0IGlmIHlvdXIgZmlsZXN5c3RlbSBjYW4gZG8KPiBzb21ldGhpbmcgY2xldmVyIG9uIGRldmlj
ZSByZW1vdmFsLCBpdCBzaG91bGQgcHJvdmlkZSBpdHMgb3duIGJsb2NrCj4gZGV2aWNlIGhvbGRl
ciBvcHMgaW5zdGVhZCBvZiB1c2luZyBmc19ob2xkZXJfb3BzLgoKVGhlbiByZS1pbXBsZW1lbnQg
YSBsb3Qgb2YgdGhpbmdzIGxpa2UgYmRldl9zdXBlcl9sb2NrKCk/CgpJJ2QgcHJlZmVyIG5vdC4K
Cgpmc19ob2xkZXJfb3BzIHNvbHZlcyBhIGxvdCBvZiB0aGluZ3MgbGlrZSBoYW5kbGluZyBtb3Vu
dGluZy9pbmFjdGl2ZSAKZnNlcywgYW5kIHB1c2hpbmcgaXQgYmFjayBhZ2FpbiB0byB0aGUgZnMg
Y29kZSBpcyBqdXN0IGNhdXNpbmcgbW9yZSAKZHVwbGljYXRpb24uCgpOb3QgcmVhbGx5IHdvcnRo
eSBpZiB3ZSBvbmx5IHdhbnQgYSBzaW5nbGUgZGlmZmVyZW50IGJlaGF2aW9yLgoKVGh1cyBJIHN0
cm9uZ2x5IHByZWZlciB0byBkbyB3aXRoIHRoZSBleGlzdGluZyBmc19ob2xkZXJfb3BzLCBubyBt
YXR0ZXIgCmlmIGl0J3MgdXNpbmcvcmVuYW1pbmcgdGhlIHNodXRkb3duKCkgY2FsbGJhY2ssIG9y
IGEgbmV3IGNhbGxiYWNrLgoKPiAgSSBkb24ndCB1bmRlcnN0YW5kCj4gd2h5IHlvdSBuZWVkIGEg
ImdlbmVyaWMiIHNvbHV0aW9uIGZvciBidHJmcyB3aGVuIGl0J3Mgbm90IGdvaW5nIHRvIGRvCj4g
d2hhdCB0aGUgb3RoZXJzIGRvIGFueXdheS4KCkJlY2F1c2UgdGhlcmUgaXMgb25seSBvbmUgYmVo
YXZpb3IgZGlmZmVyZW50LgoKT3RoZXIgdGhpbmdzIGxpa2UgZnJlZXppbmcvdGhhd2luZy9zeW5j
aW5nIGFyZSBhbGwgdGhlIHNhbWUuCgpUaGFua3MsClF1Cgo+IAo+IEF3a3dhcmQgbmFtaW5nIGlz
IG9mdGVuIGEgc2lnbiB0aGF0IGZ1cnRoZXIgdGhvdWdodCAob3IgYXQgbGVhc3QKPiBzZXBhcmF0
aW9uIG9mIGNvZGUpIGlzIG5lZWRlZC4KPiAKPiBBcyBhbiBhc2lkZToKPiAndHdvdWxkIGJlIG5p
Y2UgaWYgd2UgY291bGQgbGlmdCB0aGUgKkZTX0lPQ19TSFVURE9XTiBkaXNwYXRjaCBvdXQgb2YK
PiBldmVyeW9uZSdzIGlvY3RsIGZ1bmN0aW9ucyBpbnRvIHRoZSBWRlMsIGFuZCB0aGVuIG1vdmUg
dGhlICJJIGFtIGRlYWQiCj4gc3RhdGUgaW50byBzdXBlcl9ibG9jayBzbyB0aGF0IHlvdSBjb3Vs
ZCBhY3R1YWxseSBzaHV0IGRvd24gYW55Cj4gZmlsZXN5c3RlbSwgbm90IGp1c3QgdGhlIHNldmVu
IHRoYXQgY3VycmVudGx5IGltcGxlbWVudCBpdC4KPiAKPiAtLUQKPiAKPj4+IEhlbmNlIEJ0cmZz
IHNob3VsZCBiZSBkb2luZyB0aGUgc2FtZSB0aGluZyBhcyBiY2FjaGVmcy4gVGhlCj4+PiBiZGV2
X2hhbmRsZV9vcHMgc3RydWN0dXJlIGV4aXN0cyBwcmVjaXNseSBiZWNhdXNlIGl0IGFsbG93cyB0
aGUKPj4+IGZpbGVzeXN0ZW0gdG8gaGFuZGxlIGJsb2NrIGRldmljZSBldmVudHMgaW4gdGhlIGV4
YWN0IG1hbm5lciB0aGV5Cj4+PiByZXF1aXJlLi4uLgo+Pj4KPj4+PiAtIEFkZCBhIG5ldyBAYmRl
diBwYXJhbWV0ZXIgdG8gcmVtb3ZlX2JkZXYoKSBjYWxsYmFjawo+Pj4+ICAgICBUbyBhbGxvdyB0
aGUgZnMgdG8gZGV0ZXJtaW5lIHdoaWNoIGRldmljZSBpcyBtaXNzaW5nLCBhbmQgZG8gdGhlCj4+
Pj4gICAgIHByb3BlciBoYW5kbGluZyB3aGVuIG5lZWRlZC4KPj4+Pgo+Pj4+IEZvciB0aGUgZXhp
c3Rpbmcgc2h1dGRvd24gY2FsbGJhY2sgdXNlcnMsIHRoZSBjaGFuZ2UgaXMgbWluaW1hbC4KPj4+
Cj4+PiBFeGNlcHQgZm9yIHRoZSBjaGFuZ2UgaW4gQVBJIHNlbWFudGljcy4gLT5zaHV0ZG93biBp
cyBhbiBleHRlcm5hbAo+Pj4gc2h1dGRvd24gdHJpZ2dlciBmb3IgdGhlIGZpbGVzeXN0ZW0sIG5v
dCBhIGdlbmVyaWMgImJsb2NrIGRldmljZQo+Pj4gcmVtb3ZlZCIgbm90aWZpY2F0aW9uLgo+Pgo+
PiBUaGUgcHJvYmxlbSBpcywgdGhlcmUgaXMgbm8gb25lIHV0aWxpemluZyAtPnNodXRkb3duKCkg
b3V0IG9mCj4+IGZzX2JkZXZfbWFya19kZWFkKCkuCj4+Cj4+IElmIHNodXRkb3duIGlvY3RsIGlz
IGhhbmRsZWQgdGhyb3VnaCBzdXBlcl9vcGVyYXRpb25zOjpzaHV0ZG93biwgaXQgd2lsbCBiZQo+
PiBtb3JlIG1lYW5pbmdmdWwgdG8gc3BsaXQgc2h1dGRvd24gYW5kIGRldiByZW1vdmFsLgo+Pgo+
PiBCdXQgdGhhdCdzIG5vdCB0aGUgY2FzZSwgYW5kIGRpZmZlcmVudCBmc2VzIGV2ZW4gaGF2ZSBz
bGlnaHRseSBkaWZmZXJlbnQKPj4gaGFuZGxpbmcgZm9yIHRoZSBzaHV0ZG93biBmbGFncyAobm90
IGFsbCBmc2VzIGV2ZW4gdXRpbGl6ZSBqb3VybmFsIHRvCj4+IHByb3RlY3QgdGhlaXIgbWV0YWRh
dGEpLgo+Pgo+PiBUaGFua3MsCj4+IFF1Cj4+Cj4+Cj4+Pgo+Pj4gSG9va2luZyBibGtfaG9sZGVy
X29wcy0+bWFya19kZWFkIG1lYW5zIHRoYXQgYnRyZnMgY2FuIGFsc28gcHJvdmlkZQo+Pj4gYSAt
PnNodXRkb3duIGltcGxlbWVudGF0aW9uIGZvciB3aGVuIHNvbWV0aGluZyBleHRlcm5hbCBvdGhl
ciB0aGFuIGEKPj4+IGJsb2NrIGRldmljZSByZW1vdmFsIG5lZWRzIHRvIHNodXQgZG93biB0aGUg
ZmlsZXN5c3RlbS4uLi4KPj4+Cj4+PiAtRGF2ZS4KPj4KPiAKCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxp
c3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5z
b3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
