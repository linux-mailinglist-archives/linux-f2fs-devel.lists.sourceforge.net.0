Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DA11AFDAB8
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  9 Jul 2025 00:12:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kC3FN4+Crke2QcFEhwHFI0NKy5WbZG289OQR8hJ3E6s=; b=DyeK+CRuaHEKNAYWtJg6KTw0AQ
	xJHsNlg5sk7qWMkVxuZwkhWeQRjE41g68QSt8MgmTiXv1BdhRbzRillFHq8LJIkB/7GKPoyhI5mFm
	npbOYfDmB7Kf2zOfDAaDmE4YtuzToDykbaClZVESTum4ugDmVvQrMVSS7HXZkJAYFrKY=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uZGYC-0003nJ-2A;
	Tue, 08 Jul 2025 22:12:32 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <quwenruo.btrfs@gmx.com>) id 1uZGY9-0003nC-Px
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Jul 2025 22:12:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tKiXQzcJnHUoFYy1SQwgQQJ2Y4OJhs4iWApYS2UOz0w=; b=J8jalF7xYLvrR2voJAc4/gxGUj
 uYupjkukQ0/wY68bdlcllUu81rzjJmdeMfrfyWKtOXW0sjuGQD2izv+5s9vBH8e3U9RlPhfufqIcW
 Zo50MuA90Lo22GrZrlyTBArNdpV4cfSjH18zDeaBeQDz5mRudtK5+B5adWRXDtHLzGJ0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=tKiXQzcJnHUoFYy1SQwgQQJ2Y4OJhs4iWApYS2UOz0w=; b=C7Q/HeZp4hhp815vcY40tTZkEz
 zItyY/k7N30z1wczoKPne7Mhx0FjX9m+45YO1uzRaqbUom/S+8xma7/jeJXM6oGx8KghI+jflX6LD
 fUOUVCgMoVa/wmd8gcJiMkpOrLQ26h4QyHeIQmvB15bjFDp5Dzpc/0Id3VSF128ebzcM=;
Received: from mout.gmx.net ([212.227.17.21])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uZGY9-0005iR-1h for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Jul 2025 22:12:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.com;
 s=s31663417; t=1752012737; x=1752617537; i=quwenruo.btrfs@gmx.com;
 bh=tKiXQzcJnHUoFYy1SQwgQQJ2Y4OJhs4iWApYS2UOz0w=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=lc/jmtzsvIfILu3IOxjndYwN0WxXgGlEKxLrIeJ57F4ESKQP52XCEvwyg5mIPZuQ
 iCOEG9eFjdarPpeMtymVoon7hSNEIDqnDINnwezhhFkQq7JZuhq0cE1H9a9Kujh41
 3DwNiLTITql/IjHRkIt6zLMtzTy8rMHYE4KCucWvHgbHNYJ7h9UwTvXJYn7aDQtDI
 uSEnn07wvm6qV0MPw8G9kQOxybqtZEtQa7k4/3d6lj+4nXTOvxzHWZQW75jmeDM2F
 qn8IuFTdNTWfsBA1kDVyWGQso+6yGydsTZlsmRuNanWGKfV00ZHYRLEoejKSPUa8B
 WJG9TFWhhJLjr4MKeA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [172.16.0.229] ([159.196.52.54]) by mail.gmx.net (mrgmx105
 [212.227.17.174]) with ESMTPSA (Nemesis) id 1Mirng-1vBbVc3I9s-00qUDJ; Wed, 09
 Jul 2025 00:12:17 +0200
Message-ID: <debab09d-5eb8-4742-96f4-b2c39233f9b7@gmx.com>
Date: Wed, 9 Jul 2025 07:42:11 +0930
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Darrick J. Wong" <djwong@kernel.org>, Jan Kara <jack@suse.cz>
References: <cover.1751589725.git.wqu@suse.com>
 <de25bbdb572c75df38b1002d3779bf19e3ad0ff6.1751589725.git.wqu@suse.com>
 <aGxSHKeyldrR1Q0T@dread.disaster.area>
 <dbd955f7-b9b4-402f-97bf-6b38f0c3237e@gmx.com>
 <20250708004532.GA2672018@frogsfrogsfrogs>
 <2dm6bsup7vxwl4vwmllkvt5erncirr272bov4ehd5gix7n2vnw@bkagb26tjtj5>
 <20250708202050.GG2672049@frogsfrogsfrogs>
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
In-Reply-To: <20250708202050.GG2672049@frogsfrogsfrogs>
X-Provags-ID: V03:K1:1aTVJTVlu9i6lCW/LoieK4tzGVQNDEqTWrn2So/d5vdAo2no05b
 w7fxbRr0HI5ATdhhPmCGZPEkmqpkJ06eckuxn3KXOoJZ+jtOdc/VWu6gU9kUhR9FT/CvMDx
 Mam0v4a14/lWOLR0IfklHjEv5QOt8D4pJlHHww46UvqoSrf7Uw9cSa79lxxIVDyy3wOoYWk
 lEu2TtQLbqiPLWPbm4oQw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:geYc7ZXsxis=;bu5kTzrVCY6/wrS/1m+bAkP1XZE
 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
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "sfi-spamd-1.hosts.colo.sdot.me",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  在 2025/7/9 05:50, Darrick J. Wong 写道: [...] >> Well,
    I'd also say just go for own fs_holder_ops if it was not for the >> awkward
    "get super from bdev" step. As Christian wrote we've encapsulated [...] 
 
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
                             [212.227.17.21 listed in wl.mailspike.net]
  0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1uZGY9-0005iR-1h
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
Cc: brauner@kernel.org, ntfs3@lists.linux.dev,
 Dave Chinner <david@fromorbit.com>, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, Qu Wenruo <wqu@suse.com>,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-btrfs@vger.kernel.org, viro@zeniv.linux.org.uk
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

CgrlnKggMjAyNS83LzkgMDU6NTAsIERhcnJpY2sgSi4gV29uZyDlhpnpgZM6ClsuLi5dCj4+IFdl
bGwsIEknZCBhbHNvIHNheSBqdXN0IGdvIGZvciBvd24gZnNfaG9sZGVyX29wcyBpZiBpdCB3YXMg
bm90IGZvciB0aGUKPj4gYXdrd2FyZCAiZ2V0IHN1cGVyIGZyb20gYmRldiIgc3RlcC4gQXMgQ2hy
aXN0aWFuIHdyb3RlIHdlJ3ZlIGVuY2Fwc3VsYXRlZAo+PiB0aGF0IGluIGZzL3N1cGVyLmMgYW5k
IGJkZXZfc3VwZXJfbG9jaygpIGluIHBhcnRpY3VsYXIgYnV0IHRoZSBjYWxsaW5nCj4+IGNvbnZl
bnRpb25zIGZvciB0aGUgZnNfaG9sZGVyX29wcyBhcmUgbm90IHZlcnkgbmljZSAoaG9sZGluZwo+
PiBiZGV2X2hvbGRlcl9sb2NrLCBuZWVkIHRvIHJlbGVhc2UgaXQgYmVmb3JlIGdyYWJiaW5nIHBy
YWN0aWNhbGx5IGFueXRoaW5nCj4+IGVsc2UpIHNvIEknZCBoYXZlIG11Y2ggZ3JlYXRlciBwZWFj
ZSBvZiBtaW5kIGlmIHRoaXMgZGlkbid0IHNwcmVhZCB0b28KPj4gbXVjaC4gT25jZSB5b3UgY2Fs
bCBiZGV2X3N1cGVyX2xvY2soKSBhbmQgaG9sZCBvbiB0byBzYiB3aXRoIHNfdW1vdW50IGhlbGQs
Cj4+IHRoaW5ncyBhcmUgbXVjaCBtb3JlIGNvbnZlbnRpb25hbCBmb3IgdGhlIGZzIGxhbmQgc28g
SSdkIGxpa2UgaWYgdGhpcwo+PiBzdGVwIGhhcHBlbmVkIGJlZm9yZSBhbnkgZnMgaG9vayBnb3Qg
Y2FsbGVkLiBTbyBJIHByZWZlciBzb21ldGhpbmcgbGlrZQo+PiBRdSdzIHByb3Bvc2FsIG9mIHNl
cGFyYXRlIHNiIG9wIGZvciBkZXZpY2UgcmVtb3ZhbCBvdmVyIGV4cG9ydGluZwo+PiBiZGV2X3N1
cGVyX2xvY2soKS4gTGlrZToKPj4KPj4gc3RhdGljIHZvaWQgZnNfYmRldl9tYXJrX2RlYWQoc3Ry
dWN0IGJsb2NrX2RldmljZSAqYmRldiwgYm9vbCBzdXJwcmlzZSkKPj4gewo+PiAgICAgICAgICBz
dHJ1Y3Qgc3VwZXJfYmxvY2sgKnNiOwo+Pgo+PiAgICAgICAgICBzYiA9IGJkZXZfc3VwZXJfbG9j
ayhiZGV2LCBmYWxzZSk7Cj4+ICAgICAgICAgIGlmICghc2IpCj4+ICAgICAgICAgICAgICAgICAg
cmV0dXJuOwo+Pgo+PiAJaWYgKHNiLT5zX29wLT5yZW1vdmVfYmRldikgewo+PiAJCXNiLT5zX29w
LT5yZW1vdmVfYmRldihzYiwgYmRldiwgc3VycHJpc2UpOwoKVGhlIG9ubHkgY29uY2VybiBoZXJl
IGlzLCByZW1vdmVfYmRldigpIHdpbGwgaGFuZGxlIHR3byBkaWZmZXJlbnQgdGhpbmdzOgoKLSBN
YXJrIHRoZSB0YXJnZXQgZGV2aWNlcyBhcyBtaXNzaW5nIGFuZCBjb250aW51ZSB3b3JraW5nCiAg
IE9mIGNvdXJzZSB0aGF0J3Mgd2hlbiB0aGUgZnMgY2FuIGhhbmRsZSBpdC4KCi0gU2h1dGRvd24K
ICAgSWYgdGhlIGZzIGNhbiBub3QgaGFuZGxlIGl0LgoKQW5kIGlmIHRoZSBmcyBoYXMgdG8gc2h1
dGRvd24sIHdlJ3JlIG1pc3NpbmcgYWxsIHRoZSBzaHJpbmtzIGluIHRoZSAKc2h1dGRvd24gcGF0
aC4KClRodXMgSSdkIHByZWZlciB0aGUgcmVtb3ZlX2JkZXYoKSB0byBoYXZlIGEgcmV0dXJuIHZh
bHVlLCBzbyB0aGF0IHdlIGNhbiAKZmFsbGJhY2sgdG8gc2h1dGRvd24gcGF0aCBpZiB0aGUgcmVt
b3ZlX2JkZXYoKSBmYWlsZWQuCgpUaGlzIGFsc28gYWxpZ25zIG1vcmUgdG93YXJkcyBCcmF1bmVy
J3MgaWRlYSB0aGF0IHdlIG1heSB3YW50IHRvIGV4cG9zZSAKaWYgdGhlIGZzIGNhbiBoYW5kbGUg
dGhlIHJlbW92YWwuCgpUaGFua3MsClF1Cgo+PiAJCXJldHVybjsKPj4gCX0KPiAKPiBJdCBmZWVs
cyBvZGQgYnV0IEkgY291bGQgbGl2ZSB3aXRoIHRoaXMsIHBhcnRpY3VsYXJseSBzaW5jZSB0aGF0
J3MgdGhlCj4gZGlyZWN0aW9uIHRoYXQgYnJhdW5lciBpcyBsYXlpbmcgZG93bi4gOikKPiAKPiBE
byB3ZSBzdGlsbCBuZWVkIHRvIHN1cGVyX3VubG9ja19zaGFyZWQgaGVyZT8KPiAKPiAtLUQKPiAK
Pj4KPj4gCWlmICghc3VycHJpc2UpCj4+IAkJc3luY19maWxlc3lzdGVtKHNiKTsKPj4gCXNocmlu
a19kY2FjaGVfc2Ioc2IpOwo+PiAJZXZpY3RfaW5vZGVzKHNiKTsKPj4gCWlmIChzYi0+c19vcC0+
c2h1dGRvd24pCj4+IAkJc2ItPnNfb3AtPnNodXRkb3duKHNiKTsKPj4KPj4gCXN1cGVyX3VubG9j
a19zaGFyZWQoc2IpOwo+PiB9Cj4+Cj4+PiBBcyBhbiBhc2lkZToKPj4+ICd0d291bGQgYmUgbmlj
ZSBpZiB3ZSBjb3VsZCBsaWZ0IHRoZSAqRlNfSU9DX1NIVVRET1dOIGRpc3BhdGNoIG91dCBvZgo+
Pj4gZXZlcnlvbmUncyBpb2N0bCBmdW5jdGlvbnMgaW50byB0aGUgVkZTLCBhbmQgdGhlbiBtb3Zl
IHRoZSAiSSBhbSBkZWFkIgo+Pj4gc3RhdGUgaW50byBzdXBlcl9ibG9jayBzbyB0aGF0IHlvdSBj
b3VsZCBhY3R1YWxseSBzaHV0IGRvd24gYW55Cj4+PiBmaWxlc3lzdGVtLCBub3QganVzdCB0aGUg
c2V2ZW4gdGhhdCBjdXJyZW50bHkgaW1wbGVtZW50IGl0Lgo+Pgo+PiBZZXMsIEkgc2hvdWxkIGZp
bmQgdGltZSB0byByZXZpdmUgdGhhdCBwYXRjaCBzZXJpZXMuLi4gSXQgd2FzIG5vdCAqdGhhdCoK
Pj4gaGFyZCB0byBkby4KPj4KPj4gCQkJCQkJCQlIb256YQo+PiAtLSAKPj4gSmFuIEthcmEgPGph
Y2tAc3VzZS5jb20+Cj4+IFNVU0UgTGFicywgQ1IKPj4KCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QK
TGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3Vy
Y2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
