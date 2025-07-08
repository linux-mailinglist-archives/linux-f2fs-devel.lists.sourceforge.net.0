Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D454DAFC236
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  8 Jul 2025 07:42:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y3u43qbH/YAPT/HvIfBsxIghyxHPj2MQe3OPVANs0H0=; b=V+9QkqDBCfqSawZXivqFSVevgf
	t7WusUK7/XOylxu1teqluM4EbVni2FNM1quFTKKOd2Hvmy7raajZyUxNuiFaVI40RujTwmMfGGiJU
	v43bHf9GEUkz31E63Mq5+zOJOZbbpSInHhJsiCwkEde3H+DKduyC8cRmmBSZWhn/Hjls=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uZ160-0007vc-LE;
	Tue, 08 Jul 2025 05:42:24 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <quwenruo.btrfs@gmx.com>) id 1uZ15z-0007vW-Se
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Jul 2025 05:42:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=riyCXE5gKKYIpfq8XUSBh84iFbyW0X9hUsfvBULvywI=; b=lN7nCVr1h/qth/Jg1nztUcVqLK
 gevLXzkMdLtxRzpTPZGduytriR/NOwGU+bPXuAjAk55xUM/Lw0bGEN3Cr20pQqdmGLr7FEvFukC8F
 alFtUzmZ51EiDTT+c2SV9yTb4FPfWfvjxUumzYyHKLSRbQT6q1mtW7X5YrT1BTBtzojc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=riyCXE5gKKYIpfq8XUSBh84iFbyW0X9hUsfvBULvywI=; b=mXsZ15D+eZvEJlvd6Eo1SfWjt0
 UyhYZB2vmlvrOJmgE8AgJp/ULif1GqrkQpWTN/Cn5g7FRwhpoLsUbipfddkWO3qqv9LyzC+WRwMMT
 iOznNkDrys59iDZwkIdrGf7Y2xfwaWc1pNoRz7jtVThx71siT3tNFRc2X0Rp09nQs9Nk=;
Received: from mout.gmx.net ([212.227.17.20])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uZ15z-0002k2-1B for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Jul 2025 05:42:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.com;
 s=s31663417; t=1751953309; x=1752558109; i=quwenruo.btrfs@gmx.com;
 bh=riyCXE5gKKYIpfq8XUSBh84iFbyW0X9hUsfvBULvywI=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=aYqrLG2cm0iEAMBeW3jd4w7SLBsfxqTjxpzZhNantYHyNixKtfaLP3btMd+WtZ23
 rngCGErOAj0uzoPtUTYhF6KsgDuBjjq7uMt8ePyibFlyRHLXavD9SfDc24cRG7hvA
 sD8ezeWXQ/MW1kPkXknvAihs4/ZTKj9rOviIsdCPKRzP+lC968Fz2hJNW9mxwhQTI
 hwSaq/65jSdKq7Vbu8OW51IXPMAQRi6PwDMR2mTsESUzrbXnW+LREJwX1AZEfU/1r
 SET1/kN1P5Dy+S95j2UM90PriXebf4tBorRVNaRcKNSl08wihNvKTmPkt0xQFEYgv
 pjaAfmPna3xNNQh+FA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [172.16.0.229] ([159.196.52.54]) by mail.gmx.net (mrgmx105
 [212.227.17.174]) with ESMTPSA (Nemesis) id 1MAwXh-1uOFSH401B-000v94; Tue, 08
 Jul 2025 07:41:49 +0200
Message-ID: <31d4c67f-160b-456d-a47b-869ddc5be6d0@gmx.com>
Date: Tue, 8 Jul 2025 15:11:43 +0930
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dave Chinner <david@fromorbit.com>
References: <cover.1751589725.git.wqu@suse.com>
 <de25bbdb572c75df38b1002d3779bf19e3ad0ff6.1751589725.git.wqu@suse.com>
 <aGxSHKeyldrR1Q0T@dread.disaster.area>
 <dbd955f7-b9b4-402f-97bf-6b38f0c3237e@gmx.com>
 <20250708004532.GA2672018@frogsfrogsfrogs>
 <02584a40-a2c0-4565-ab46-50c1a4100b21@gmx.com>
 <bdce1e62-c6dd-4f40-b207-cfaf4c5e25e4@gmx.com>
 <aGynIewLL-05fuoJ@dread.disaster.area>
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
In-Reply-To: <aGynIewLL-05fuoJ@dread.disaster.area>
X-Provags-ID: V03:K1:DZshX1x/Z8YAMhLnJ2+UeFiwTjMPrwyrZ85RITtwjEDU/AurW5K
 +SJ2veNL9n+tpNoL2eb53lzkrhbexEmLh0BbM4wCDbF4GWdweUxd132TGn0w87/x1fnkJPo
 ZAkV1lR+zGtIh2Fy0g+dRWJiGdAjtu6aSWAS0Vt1NAl9PEJI/FJ+4oQFh0H1GZA36FTo9+n
 Cq4/YglOlX5B3fEx2wl7A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:2TVEOnqouYY=;TnGclIOpdVuPZRjCsvWX+V4Y8+6
 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
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "sfi-spamd-2.hosts.colo.sdot.me",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  在 2025/7/8 14:35, Dave Chinner 写道: [...] >>> Not really
    worthy if we only want a single different behavior. > > This is the *3rd*
    different behaviour for ->mark_dead. We > have the generic behav [...] 
 
 Content analysis details:   (-0.2 points, 5.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
                             [212.227.17.20 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from author's
                             domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail provider
                             [quwenruo.btrfs(at)gmx.com]
X-Headers-End: 1uZ15z-0002k2-1B
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
 "Darrick J. Wong" <djwong@kernel.org>, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, Qu Wenruo <wqu@suse.com>,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-btrfs@vger.kernel.org, viro@zeniv.linux.org.uk
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

CgrlnKggMjAyNS83LzggMTQ6MzUsIERhdmUgQ2hpbm5lciDlhpnpgZM6ClsuLi5dCj4+PiBOb3Qg
cmVhbGx5IHdvcnRoeSBpZiB3ZSBvbmx5IHdhbnQgYSBzaW5nbGUgZGlmZmVyZW50IGJlaGF2aW9y
Lgo+IAo+IFRoaXMgaXMgdGhlICozcmQqIGRpZmZlcmVudCBiZWhhdmlvdXIgZm9yIC0+bWFya19k
ZWFkLiBXZQo+IGhhdmUgdGhlIGdlbmVyaWMgYmVoYXZpb3VyLCB0aGUgYmNhY2hlZnMgYmVoYXZp
b3VyLCBhbmQgbm93IHRoZQo+IGJ0cmZzIGJlaGF2aW91ciAod2hhdGV2ZXIgdGhhdCBtYXkgYmUp
LgoKVGhlbiB3aHkgbm90IG1lcmdpbmcgdGhlIGJ0cmZzL2JjYWNoZWZzIGNhbGxiYWNrIGludG8g
b25lIGdlbmVyaWMgCmNhbGxiYWNrPyBPdGhlciB0aGFuIGludHJvZHVjaW5nIDMgZGlmZmVyZW50
IGJkZXZfaG9sZGVyX29wcz8KClRoaXMgbG9va3MgZXhhY3RseSB0aGUgb3Bwb3NpdGUgd2hhdCBW
RlMgaXMgdHJ5aW5nIHRvIGRvLgoKVGhhbmtzLApRdQoKPiAKPj4+IFRodXMgSSBzdHJvbmdseSBw
cmVmZXIgdG8gZG8gd2l0aCB0aGUgZXhpc3RpbmcgZnNfaG9sZGVyX29wcywgbm8gbWF0dGVyCj4+
PiBpZiBpdCdzIHVzaW5nL3JlbmFtaW5nIHRoZSBzaHV0ZG93bigpIGNhbGxiYWNrLCBvciBhIG5l
dyBjYWxsYmFjay4KPj4KPj4gUHJldmlvdXNseSBDaHJpc3RvcGggaXMgYWdhaW5zdCBhIG5ldyAt
PnJlbW92ZV9iZGV2KCkgY2FsbGJhY2ssIGFzIGl0IGlzCj4+IGNvbmZsaWN0aW5nIHdpdGggdGhl
IGV4aXN0aW5nIC0+c2h1dGRvd24oKS4KPj4KPj4gU28gd2hhdCBhYm91dCBhIG5ldyAtPmhhbmRs
ZV9iZGV2X3JlbW92ZSgpIGNhbGxiYWNrLCB0aGF0IHdlIGRvIHNvbWV0aGluZwo+PiBsaWtlIHRo
aXMgaW5zaWRlIGZzX2JkZXZfbWFya19kZWFkKCk6Cj4+Cj4+IHsKPj4gCWJkZXZfc3VwZXJfbG9j
aygpOwo+PiAJaWYgKCFzdXJwcmlzZSkKPj4gCQlzeW5jX2ZpbGVzeXN0ZW0oKTsKPj4KPj4gCWlm
IChzX29wLT5oYW5kbGVfYmRldl9yZW1vdmUpIHsKPj4gCQlyZXQgPSBzX29wLT5oYW5kbGVfYmRl
dl9yZW1vdmUoKTsKPj4gCQlpZiAoIXJldCkgewo+PiAJCQlzdXBlcl91bmxvY2tfc2hhcmVkKCk7
Cj4+IAkJCXJldHVybjsKPj4gCQl9Cj4+IAl9Cj4+IAlzaHJpbmtfZGNhY2hlX3NiKCk7Cj4+IAll
dmljdF9pbm9kZXMoKTsKPj4gCWlmIChzX29wLT5zaHV0ZG93bikKPj4gCQlzX29wLT5zaHV0ZG93
bigpOwo+PiB9Cj4+Cj4+IFNvIHRoYXQgdGhlIG5ldyAtPmhhbmRsZV9iZGV2X3JlbW92ZSgpIGlz
IG5vdCBjb25mbGljdGluZyB3aXRoCj4+IC0+c2h1dGRvd24oKSBidXQgYW4gb3B0aW9uYWwgb25l
Lgo+Pgo+PiBBbmQgaWYgdGhlIGZzIGNhbiBub3QgaGFuZGxlIHRoZSByZW1vdmFsLCBqdXN0IGxl
dAo+PiAtPmhhbmRsZV9iZGV2X3JlbW92ZSgpIHJldHVybiBhbiBlcnJvciBzbyB0aGF0IHdlIGZh
bGxiYWNrIHRvIHRoZSBleGlzdGluZwo+PiBzaHV0ZG93biByb3V0aW5lLgo+Pgo+PiBXb3VsZCB0
aGlzIGJlIG1vcmUgYWNjZXB0YWJsZT8KPiAKPiBOby4KPiAKPiAtRGF2ZS4KCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBt
YWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6
Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
