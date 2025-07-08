Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AEEF5AFC125
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  8 Jul 2025 05:07:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UX+gufuU9t7wNaX47M+UMZ9t5c76n19RcgcNQuyAHXo=; b=TOBmRiJD7V15GTOKY/NHK/nsRf
	FfDjcUSKTQ+baANMNAwL/mma3w/1pE9Q08dK+XkoCgS+/MKF4LTXurvQoTzQ4UeykQUabdBJC8b2v
	He79WCO0w+NVpQAeokoIdPfrTh0imFxQNwBLmZuHSnd7XyCzQnd0CR1gqupDK+JhT8oY=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uYygA-0002km-Cw;
	Tue, 08 Jul 2025 03:07:34 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <quwenruo.btrfs@gmx.com>) id 1uYyg4-0002kB-33
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Jul 2025 03:07:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9AkzgC4LlgXiHeb40Q9FmYsfdBTPMHgFtx84I6wW3D4=; b=FUHTSx0gokZ+XaSWGlD2N4YIge
 Wpa5aMoQqBkmTztjfLKrEOekOqtMUG/y4AZEXp/ukpMeosijsDVjUD0cofSOtgt1cvwbYQRSAfz4J
 8+Apn6j/GFTz6naMfA9OPUPeAyljC55Hcv5C9qRiIGXLHOothYeG+YGUAFyiyoAzg9PY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9AkzgC4LlgXiHeb40Q9FmYsfdBTPMHgFtx84I6wW3D4=; b=MyFh6QSiYL9lX1bGPa70yjmQuJ
 xpsAZN9nY/HR0I7r9Tm9LBk9m7zgy7aVUpst08cG+y1Yy3En8jUSlVb5hje6tQ509COmdODFdPobS
 uN5TDuP7v+OTdLGc/Tj1OAy6W5XlK4wyIr9RClFsigPnh8g6xAfSpJB/pLg8+25HnD80=;
Received: from mout.gmx.net ([212.227.17.21])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uYyg3-0006s6-9C for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Jul 2025 03:07:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.com;
 s=s31663417; t=1751944016; x=1752548816; i=quwenruo.btrfs@gmx.com;
 bh=9AkzgC4LlgXiHeb40Q9FmYsfdBTPMHgFtx84I6wW3D4=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=QGjBb7Xg76I5cepZC7k+sDhZKiY9iZBexu2Slm5KiAoVa6wAi26NQIoSpK5MMFgS
 zCSnGqba7J6DP0Z1qNIZ53wXLv+PgZFuqDT0ND0quKkTdPQuX1G06QNIEEhP/yUVs
 bkemeR+Z9HuYb8Cb41twO+KpyIBw9YVVDHWU8PY8YlbG5tlu7nktyKlQy+hQtyuPx
 yB5BNF+SGdgOtltiHjfR4FqkHP8eRz0JtBU1FnHxprpJY5lehgq4jlZhEb0vVmoj5
 1NUKArBjAlg5vrmQDefy3p161M2IgSL0DgpoXdFBhfwUpDoG+nAP8uKl90kYM3xCa
 67n5CD400KtneLbelQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [172.16.0.229] ([159.196.52.54]) by mail.gmx.net (mrgmx105
 [212.227.17.174]) with ESMTPSA (Nemesis) id 1MOzSu-1uIYmR1jB6-00WURW; Tue, 08
 Jul 2025 05:06:55 +0200
Message-ID: <bdce1e62-c6dd-4f40-b207-cfaf4c5e25e4@gmx.com>
Date: Tue, 8 Jul 2025 12:36:48 +0930
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Darrick J. Wong" <djwong@kernel.org>
References: <cover.1751589725.git.wqu@suse.com>
 <de25bbdb572c75df38b1002d3779bf19e3ad0ff6.1751589725.git.wqu@suse.com>
 <aGxSHKeyldrR1Q0T@dread.disaster.area>
 <dbd955f7-b9b4-402f-97bf-6b38f0c3237e@gmx.com>
 <20250708004532.GA2672018@frogsfrogsfrogs>
 <02584a40-a2c0-4565-ab46-50c1a4100b21@gmx.com>
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
In-Reply-To: <02584a40-a2c0-4565-ab46-50c1a4100b21@gmx.com>
X-Provags-ID: V03:K1:2uUHVMbXI47p/AI325FvUcM1/NPkQSa7e22wurBVRkYZWtBEG9+
 KxGZW9RvAvS4omNKm93sr2isMPhuwkIAR1Te9f4cB0gx35BTUzUIsd+b1qC7CVb7OAYuZcw
 Yu8UZcmytWqWW8HALz0VRXMuG4rW3jXgVhSjW8qGzTOvLoJSMH8bnFkgWtvvUmohZBUICnC
 TQ/uRc/BhQwcegfxg4f+g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:cqTZ8MddLiQ=;OOTm8pMVOQ0XR4tqU/yKcjDSCxc
 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
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "sfi-spamd-1.hosts.colo.sdot.me",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  在 2025/7/8 11:39, Qu Wenruo 写道: > > > 在 2025/7/8
   10:15, Darrick J. Wong 写道: > [...] >>> >>> I do not think it's the correct
    way to go, especially when there is >>> already >>> fs_holder_op [...] 
 
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
X-Headers-End: 1uYyg3-0006s6-9C
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

CgrlnKggMjAyNS83LzggMTE6MzksIFF1IFdlbnJ1byDlhpnpgZM6Cj4gCj4gCj4g5ZyoIDIwMjUv
Ny84IDEwOjE1LCBEYXJyaWNrIEouIFdvbmcg5YaZ6YGTOgo+IFsuLi5dCj4+Pgo+Pj4gSSBkbyBu
b3QgdGhpbmsgaXQncyB0aGUgY29ycmVjdCB3YXkgdG8gZ28sIGVzcGVjaWFsbHkgd2hlbiB0aGVy
ZSBpcyAKPj4+IGFscmVhZHkKPj4+IGZzX2hvbGRlcl9vcHMuCj4+Pgo+Pj4gV2UncmUgYWx3YXlz
IGdvaW5nIHRvd2FyZHMgYSBtb3JlIGdlbmVyaWMgc29sdXRpb24sIG90aGVyIHRoYW4gCj4+PiBs
ZXR0aW5nIHRoZQo+Pj4gaW5kaXZpZHVhbCBmcyB0byBkbyB0aGUgc2FtZSB0aGluZyBzbGlnaHRs
eSBkaWZmZXJlbnRseS4KPj4KPj4gT24gc2Vjb25kIHRob3VnaHQgLS0gaXQncyB3ZWlyZCB0aGF0
IHlvdSdkIGZsdXNoIHRoZSBmaWxlc3lzdGVtIGFuZAo+PiBzaHJpbmsgdGhlIGlub2RlL2RlbnRy
eSBjYWNoZXMgaW4gYSAieW91ciBkZXZpY2Ugd2VudCBhd2F5IiBoYW5kbGVyLgo+PiBGYW5jeSBm
aWxlc3lzdGVtcyBsaWtlIGJjYWNoZWZzIGFuZCBidHJmcyB3b3VsZCBsaWtlbHkganVzdCBzaGlm
dCBJTyB0bwo+PiBhIGRpZmZlcmVudCBiZGV2LCByaWdodD/CoCBBbmQgdGhlcmUncyBubyBnb29k
IHJlYXNvbiB0byBydW4gc2hyaW5rZXJzIG9uCj4+IGVpdGhlciBvZiB0aG9zZSBmc2VzLCByaWdo
dD8KPiAKPiBUaGF0J3MgcmlnaHQsIHNvbWUgcGFydCBvZiBmc19iZGV2X21hcmtfZGVhZCgpIGlz
IG5vdCBtYWtpbmcgbXVjaCBzZW5zZSAKPiBpZiB0aGUgZnMgY2FuIGhhbmRsZSB0aGUgZGV2IGxv
c3MuCj4gCj4+Cj4+PiBZZXMsIHRoZSBuYW1pbmcgaXMgbm90IHBlcmZlY3QgYW5kIG1peGluZyBj
YXVzZSBhbmQgYWN0aW9uLCBidXQgdGhlIGVuZAo+Pj4gcmVzdWx0IGlzIHN0aWxsIGEgbW9yZSBn
ZW5lcmljIGFuZCBsZXNzIGR1cGxpY2F0ZWQgY29kZSBiYXNlLgo+Pgo+PiBJIHRoaW5rIGRjaGlu
bmVyIG1ha2VzIGEgZ29vZCBwb2ludCB0aGF0IGlmIHlvdXIgZmlsZXN5c3RlbSBjYW4gZG8KPj4g
c29tZXRoaW5nIGNsZXZlciBvbiBkZXZpY2UgcmVtb3ZhbCwgaXQgc2hvdWxkIHByb3ZpZGUgaXRz
IG93biBibG9jawo+PiBkZXZpY2UgaG9sZGVyIG9wcyBpbnN0ZWFkIG9mIHVzaW5nIGZzX2hvbGRl
cl9vcHMuCj4gCj4gVGhlbiByZS1pbXBsZW1lbnQgYSBsb3Qgb2YgdGhpbmdzIGxpa2UgYmRldl9z
dXBlcl9sb2NrKCk/Cj4gCj4gSSdkIHByZWZlciBub3QuCj4gCj4gCj4gZnNfaG9sZGVyX29wcyBz
b2x2ZXMgYSBsb3Qgb2YgdGhpbmdzIGxpa2UgaGFuZGxpbmcgbW91bnRpbmcvaW5hY3RpdmUgCj4g
ZnNlcywgYW5kIHB1c2hpbmcgaXQgYmFjayBhZ2FpbiB0byB0aGUgZnMgY29kZSBpcyBqdXN0IGNh
dXNpbmcgbW9yZSAKPiBkdXBsaWNhdGlvbi4KPiAKPiBOb3QgcmVhbGx5IHdvcnRoeSBpZiB3ZSBv
bmx5IHdhbnQgYSBzaW5nbGUgZGlmZmVyZW50IGJlaGF2aW9yLgo+IAo+IFRodXMgSSBzdHJvbmds
eSBwcmVmZXIgdG8gZG8gd2l0aCB0aGUgZXhpc3RpbmcgZnNfaG9sZGVyX29wcywgbm8gbWF0dGVy
IAo+IGlmIGl0J3MgdXNpbmcvcmVuYW1pbmcgdGhlIHNodXRkb3duKCkgY2FsbGJhY2ssIG9yIGEg
bmV3IGNhbGxiYWNrLgoKUHJldmlvdXNseSBDaHJpc3RvcGggaXMgYWdhaW5zdCBhIG5ldyAtPnJl
bW92ZV9iZGV2KCkgY2FsbGJhY2ssIGFzIGl0IGlzIApjb25mbGljdGluZyB3aXRoIHRoZSBleGlz
dGluZyAtPnNodXRkb3duKCkuCgpTbyB3aGF0IGFib3V0IGEgbmV3IC0+aGFuZGxlX2JkZXZfcmVt
b3ZlKCkgY2FsbGJhY2ssIHRoYXQgd2UgZG8gCnNvbWV0aGluZyBsaWtlIHRoaXMgaW5zaWRlIGZz
X2JkZXZfbWFya19kZWFkKCk6Cgp7CgliZGV2X3N1cGVyX2xvY2soKTsKCWlmICghc3VycHJpc2Up
CgkJc3luY19maWxlc3lzdGVtKCk7CgoJaWYgKHNfb3AtPmhhbmRsZV9iZGV2X3JlbW92ZSkgewoJ
CXJldCA9IHNfb3AtPmhhbmRsZV9iZGV2X3JlbW92ZSgpOwoJCWlmICghcmV0KSB7CgkJCXN1cGVy
X3VubG9ja19zaGFyZWQoKTsKCQkJcmV0dXJuOwoJCX0KCX0KCXNocmlua19kY2FjaGVfc2IoKTsK
CWV2aWN0X2lub2RlcygpOwoJaWYgKHNfb3AtPnNodXRkb3duKQoJCXNfb3AtPnNodXRkb3duKCk7
Cn0KClNvIHRoYXQgdGhlIG5ldyAtPmhhbmRsZV9iZGV2X3JlbW92ZSgpIGlzIG5vdCBjb25mbGlj
dGluZyB3aXRoCi0+c2h1dGRvd24oKSBidXQgYW4gb3B0aW9uYWwgb25lLgoKQW5kIGlmIHRoZSBm
cyBjYW4gbm90IGhhbmRsZSB0aGUgcmVtb3ZhbCwganVzdCBsZXQKLT5oYW5kbGVfYmRldl9yZW1v
dmUoKSByZXR1cm4gYW4gZXJyb3Igc28gdGhhdCB3ZSBmYWxsYmFjayB0byB0aGUgCmV4aXN0aW5n
IHNodXRkb3duIHJvdXRpbmUuCgpXb3VsZCB0aGlzIGJlIG1vcmUgYWNjZXB0YWJsZT8KClRoYW5r
cywKUXUKCj4gCj4+IMKgSSBkb24ndCB1bmRlcnN0YW5kCj4+IHdoeSB5b3UgbmVlZCBhICJnZW5l
cmljIiBzb2x1dGlvbiBmb3IgYnRyZnMgd2hlbiBpdCdzIG5vdCBnb2luZyB0byBkbwo+PiB3aGF0
IHRoZSBvdGhlcnMgZG8gYW55d2F5Lgo+IAo+IEJlY2F1c2UgdGhlcmUgaXMgb25seSBvbmUgYmVo
YXZpb3IgZGlmZmVyZW50Lgo+IAo+IE90aGVyIHRoaW5ncyBsaWtlIGZyZWV6aW5nL3RoYXdpbmcv
c3luY2luZyBhcmUgYWxsIHRoZSBzYW1lLgo+IAo+IFRoYW5rcywKPiBRdQo+IAo+Pgo+PiBBd2t3
YXJkIG5hbWluZyBpcyBvZnRlbiBhIHNpZ24gdGhhdCBmdXJ0aGVyIHRob3VnaHQgKG9yIGF0IGxl
YXN0Cj4+IHNlcGFyYXRpb24gb2YgY29kZSkgaXMgbmVlZGVkLgo+Pgo+PiBBcyBhbiBhc2lkZToK
Pj4gJ3R3b3VsZCBiZSBuaWNlIGlmIHdlIGNvdWxkIGxpZnQgdGhlICpGU19JT0NfU0hVVERPV04g
ZGlzcGF0Y2ggb3V0IG9mCj4+IGV2ZXJ5b25lJ3MgaW9jdGwgZnVuY3Rpb25zIGludG8gdGhlIFZG
UywgYW5kIHRoZW4gbW92ZSB0aGUgIkkgYW0gZGVhZCIKPj4gc3RhdGUgaW50byBzdXBlcl9ibG9j
ayBzbyB0aGF0IHlvdSBjb3VsZCBhY3R1YWxseSBzaHV0IGRvd24gYW55Cj4+IGZpbGVzeXN0ZW0s
IG5vdCBqdXN0IHRoZSBzZXZlbiB0aGF0IGN1cnJlbnRseSBpbXBsZW1lbnQgaXQuCj4+Cj4+IC0t
RAo+Pgo+Pj4+IEhlbmNlIEJ0cmZzIHNob3VsZCBiZSBkb2luZyB0aGUgc2FtZSB0aGluZyBhcyBi
Y2FjaGVmcy4gVGhlCj4+Pj4gYmRldl9oYW5kbGVfb3BzIHN0cnVjdHVyZSBleGlzdHMgcHJlY2lz
bHkgYmVjYXVzZSBpdCBhbGxvd3MgdGhlCj4+Pj4gZmlsZXN5c3RlbSB0byBoYW5kbGUgYmxvY2sg
ZGV2aWNlIGV2ZW50cyBpbiB0aGUgZXhhY3QgbWFubmVyIHRoZXkKPj4+PiByZXF1aXJlLi4uLgo+
Pj4+Cj4+Pj4+IC0gQWRkIGEgbmV3IEBiZGV2IHBhcmFtZXRlciB0byByZW1vdmVfYmRldigpIGNh
bGxiYWNrCj4+Pj4+IMKgwqDCoCBUbyBhbGxvdyB0aGUgZnMgdG8gZGV0ZXJtaW5lIHdoaWNoIGRl
dmljZSBpcyBtaXNzaW5nLCBhbmQgZG8gdGhlCj4+Pj4+IMKgwqDCoCBwcm9wZXIgaGFuZGxpbmcg
d2hlbiBuZWVkZWQuCj4+Pj4+Cj4+Pj4+IEZvciB0aGUgZXhpc3Rpbmcgc2h1dGRvd24gY2FsbGJh
Y2sgdXNlcnMsIHRoZSBjaGFuZ2UgaXMgbWluaW1hbC4KPj4+Pgo+Pj4+IEV4Y2VwdCBmb3IgdGhl
IGNoYW5nZSBpbiBBUEkgc2VtYW50aWNzLiAtPnNodXRkb3duIGlzIGFuIGV4dGVybmFsCj4+Pj4g
c2h1dGRvd24gdHJpZ2dlciBmb3IgdGhlIGZpbGVzeXN0ZW0sIG5vdCBhIGdlbmVyaWMgImJsb2Nr
IGRldmljZQo+Pj4+IHJlbW92ZWQiIG5vdGlmaWNhdGlvbi4KPj4+Cj4+PiBUaGUgcHJvYmxlbSBp
cywgdGhlcmUgaXMgbm8gb25lIHV0aWxpemluZyAtPnNodXRkb3duKCkgb3V0IG9mCj4+PiBmc19i
ZGV2X21hcmtfZGVhZCgpLgo+Pj4KPj4+IElmIHNodXRkb3duIGlvY3RsIGlzIGhhbmRsZWQgdGhy
b3VnaCBzdXBlcl9vcGVyYXRpb25zOjpzaHV0ZG93biwgaXQgCj4+PiB3aWxsIGJlCj4+PiBtb3Jl
IG1lYW5pbmdmdWwgdG8gc3BsaXQgc2h1dGRvd24gYW5kIGRldiByZW1vdmFsLgo+Pj4KPj4+IEJ1
dCB0aGF0J3Mgbm90IHRoZSBjYXNlLCBhbmQgZGlmZmVyZW50IGZzZXMgZXZlbiBoYXZlIHNsaWdo
dGx5IGRpZmZlcmVudAo+Pj4gaGFuZGxpbmcgZm9yIHRoZSBzaHV0ZG93biBmbGFncyAobm90IGFs
bCBmc2VzIGV2ZW4gdXRpbGl6ZSBqb3VybmFsIHRvCj4+PiBwcm90ZWN0IHRoZWlyIG1ldGFkYXRh
KS4KPj4+Cj4+PiBUaGFua3MsCj4+PiBRdQo+Pj4KPj4+Cj4+Pj4KPj4+PiBIb29raW5nIGJsa19o
b2xkZXJfb3BzLT5tYXJrX2RlYWQgbWVhbnMgdGhhdCBidHJmcyBjYW4gYWxzbyBwcm92aWRlCj4+
Pj4gYSAtPnNodXRkb3duIGltcGxlbWVudGF0aW9uIGZvciB3aGVuIHNvbWV0aGluZyBleHRlcm5h
bCBvdGhlciB0aGFuIGEKPj4+PiBibG9jayBkZXZpY2UgcmVtb3ZhbCBuZWVkcyB0byBzaHV0IGRv
d24gdGhlIGZpbGVzeXN0ZW0uLi4uCj4+Pj4KPj4+PiAtRGF2ZS4KPj4+Cj4+Cj4gCj4gCgoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMt
ZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0
Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMt
ZGV2ZWwK
