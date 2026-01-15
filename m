Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 984D6D27F8C
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 15 Jan 2026 20:14:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WxCisnrgFhA8BRume5InC0E445PJtu5sJ/RaIe69fx0=; b=fE5PXCKs+rSqQAPiOt8gklP3LO
	BKs9kzVlYuCudvVu+O2o95tXF/ZiRf841lGfM1EBvHgEAmE0aevWHolRmg4AiNS1j3/ztX183GgDr
	MlwfywgNs8DK3N6+8Q39Gr1ExpN65wDuOtGP7q4rITs/PTktMeLGf1Lvxwdm2du7KVw4=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vgSnd-0003OM-NI;
	Thu, 15 Jan 2026 19:14:29 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <amir73il@gmail.com>) id 1vgSnc-0003OG-7b
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 15 Jan 2026 19:14:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bpVL1RB5I8PR85y4mxEedr9T/Q0DYVA2jeDelSaqSc8=; b=cW6hEkgy9fqmrmjUdQ3nTJcErg
 81PbXINp5i9yErxEEFx3dJBsbBRZSfnCxiirUxKk6TXtvj0pRJ8JXufCfxwUA0Q3Uxy94vYJrauTg
 lP4GVDUg+fj9vTBR3LYqQz9Ci6rHtRyZ/GUYhpKyMNe1CpyDeZJPqyadJ7k8x8hgTHVM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bpVL1RB5I8PR85y4mxEedr9T/Q0DYVA2jeDelSaqSc8=; b=e5KrM+k1cR8mte1OcoBU+5z12n
 QFGj+WcHb10RpX+stAKxD7/mH2l2n6xHzHQpSw67xoUbW5YK06Y7jLkZ7MKCwGaboueUgdIM500T5
 e8V5InXPgsYUzkflFrEEeIuLi6HUh5cVnlCT1Xr6naz8N9bwPcFlF3wDZqm1U179/UJU=;
Received: from mail-wm1-f47.google.com ([209.85.128.47])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vgSnb-0003bC-QN for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 15 Jan 2026 19:14:28 +0000
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-47d1d8a49f5so7961045e9.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 15 Jan 2026 11:14:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768504461; cv=none;
 d=google.com; s=arc-20240605;
 b=PSTWyvFCqSCMm3abNguhZqblXF96Z4ICdzetKL/ZZmWqf/zxfW7wmmHFCoVb3N8Pdm
 J6Yu8FTAH9+i2JTYLNhxqMUkGoT2nVykCFR1UWhx5XdAYOtosdwZpqyVg7xM9U0jGvVV
 i0ezm9kphZMp3RaiOTCZwanketAi3L91M5bjLlqAuXKTZubQL1634f+/o/calutPx7ks
 fdrVPkCJEpOx3IfoMvgI+cCzju0uz0y4+UbVD0gdJ0lwM/wm6Em6+VNUkaH2CVL89F1G
 hfqgkEZW6ehf2hA6qNSbhF93nheVEOi5UMr+xMkgFTChH+0UvOMV/QFAlGD/umhu1Hcz
 4f+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=bpVL1RB5I8PR85y4mxEedr9T/Q0DYVA2jeDelSaqSc8=;
 fh=S18vkVloOasi/3F+YTr6sL2Ks/OVNTsKCPsJWBtY5xg=;
 b=Wqv/AHhtwFOffDC+MT/Ybnk6SLgF0wG904lV0AeNUG7ZQaqIO+L9AUxgqtq7ATj2mP
 dNnn56h8ai/ksy/Q7936d74usO4LhCyK9f1BXRSqhdo2EC0BCQLwV9nGFTpOOBSwRhSr
 8boNJeIgjEqILC4sFkeJNoyAGmz4cjUpVgnYQQ+eNxcjsJQSnTOqZ0SZSlz5RA09jVwN
 YlxVeWohCYenVg0FL4VUdvLlrKvDqp75cQ2/2Za594235g13pwcJ7XLNE+CwS2LzQER5
 6UNByTtpEptewkbsPck3KxxxyJaB7NB8JaYSTWZSk0IQygVov2crm/afGeUGnW0G1flC
 KrTA==; darn=lists.sourceforge.net
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768504461; x=1769109261; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bpVL1RB5I8PR85y4mxEedr9T/Q0DYVA2jeDelSaqSc8=;
 b=aoOT0G+xuIxO24aIuct/j06MIbxbOpSTtkesDjhwS1Iqnh+OK4LUGSqMhqHpkCURs3
 8O0YZY7Vftm4uipABeWw665FTCEGJrVGCSUUlBl7WNmSt9c/yDt/GQjrGME2FVQviP1h
 erQPjiri8l6wt6ckh5rQlgjDo2+lcojw6NoNwLlPV2/qY1h8PXXLiHgSMDudpl5RJKzm
 I0f2ykZwqfJGqrxbDoKjkznfnhKOSaog+9ZEycbEYQzI0SLyCnn2tzBkKnodG+dH6Ds1
 IiMhR/kF+bG1YJ/WRnprBGSJXvwpAozMNxQO+vrVidrmDONApl4Gzy3jMZotOKNM2unz
 tq3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768504461; x=1769109261;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=bpVL1RB5I8PR85y4mxEedr9T/Q0DYVA2jeDelSaqSc8=;
 b=uGc9p4P+wU/xGnaJxfF4KdtokZbJFyS8PZCvMiFHGkzXPvKn3s9n5Dln2EHrqWl56y
 CIWcJMyFXEKsvgnWjeUCne0jq+f9NeFAJx6NzBjmtc6dzYcZSZjXLAQrtnN9ITKYKtvi
 Mvkc/BD+WxsjbNev6PrIedOhjZlXvtum1nREt4q4yHCUIXJNW3nsLHjlAIrZ7haOOsDm
 nP1QPbRvNVLneacsI6GI92ZjMShhECd3LrbHVfXYDOlKLGWBR3b0dJ6KmIm39/0/sCYq
 Hn4MnNWraPaKNUsVkT96lkbyATC0bMSltKk1zgh1+8PsQfz7vAOnCxDlNB9pd2IR3TNU
 A1ZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXdBKBSaYEmlTkd9shkuWRCuPcSVY4Mmw0JY4YfQDBQAc+rifDrpMr6aPvNNvIa20b8pLj0s5y4lrpYfO2vpcn1@lists.sourceforge.net
X-Gm-Message-State: AOJu0YybMZIiZ6hXDUtM5c8y5UeCAkkpDegIc6QW712/wPqcbp8y4Auw
 eZiUvNga8hj+j77XCGRMFGK54gdQWnuc5PDZwltVZKJsFbXFFcyCchdR2ap8U1ZZ67qKBvYiest
 zC9gz8w8GBKcrNWICQBfAdBkLg30NR3M=
X-Gm-Gg: AY/fxX7X9a4aERB6hbUgOC8RwfONfUVkQ1Z9PvBlwdYbzR8FpdrJXUtgtsnVbfUrYB1
 3PV81aRD5vXWvNYdBA+B5oWL4IDzAsmPVuOsT731/AF9cbU+wxcvDJTLAyerLS0DaBVcSlyj9G4
 d7Hw8nctSSQAKQZEc1VXHiVwcTaqudypvL8OiDtoE11Q0KQWMVVtud5Fiaqmegchmnx2MHRRKRk
 2TA4wyiYKlhPvl+E8fQotgxlcDXggVONfKHheRofoDQLlVej/J+Lnnbg86MuMJe9covqmLeLxau
 KfrWKOqggQq+SKx07ikV6va4Zrl5ig==
X-Received: by 2002:a05:600c:5487:b0:46f:d682:3c3d with SMTP id
 5b1f17b1804b1-4801e30d482mr9929055e9.13.1768504460920; Thu, 15 Jan 2026
 11:14:20 -0800 (PST)
MIME-Version: 1.0
References: <20260115-exportfs-nfsd-v1-0-8e80160e3c0c@kernel.org>
 <CAOQ4uxjOJMwv_hRVTn3tJHDLMQHbeaCGsdLupiZYcwm7M2rm3g@mail.gmail.com>
 <d486fdb8-686c-4426-9fac-49b7dbc28765@app.fastmail.com>
In-Reply-To: <d486fdb8-686c-4426-9fac-49b7dbc28765@app.fastmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Thu, 15 Jan 2026 20:14:09 +0100
X-Gm-Features: AZwV_QgZJLcC_-bQ-_VIrtnGFnLgmiVjy_ytBB44u2cGVyBOwKNqVyWt_Jfm7Ds
Message-ID: <CAOQ4uxhnoTC6KBmRVx2xhvTXYg1hRkCJWrq2eoBQGHKC3sv3Hw@mail.gmail.com>
To: Chuck Lever <cel@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Jan 15, 2026 at 7:32 PM Chuck Lever wrote: > > > >
 On Thu, Jan 15, 2026, at 1:17 PM, Amir Goldstein wrote: > > On Thu, Jan 15,
 2026 at 6:48 PM Jeff Layton wrote: > >> > >> In recent years, [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.47 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 ARC_SIGNED             Message has a ARC signature
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 ARC_VALID              Message has a valid ARC signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [amir73il(at)gmail.com]
X-Headers-End: 1vgSnb-0003bC-QN
Subject: Re: [f2fs-dev] [PATCH 00/29] fs: require filesystems to explicitly
 opt-in to nfsd export support
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
Cc: Martin Brandenburg <martin@omnibond.com>,
 jfs-discussion@lists.sourceforge.net, Jan Kara <jack@suse.cz>,
 Paulo Alcantara <pc@manguebit.org>, Alex Markuze <amarkuze@redhat.com>,
 Sandeep Dhavale <dhavale@google.com>, linux-btrfs@vger.kernel.org,
 Carlos Maiolino <cem@kernel.org>, linux-unionfs@vger.kernel.org,
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
 Chris Mason <clm@fb.com>, Andreas Dilger <adilger.kernel@dilger.ca>,
 Chunhai Guo <guochunhai@vivo.com>, Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 linux-mtd@lists.infradead.org, Mike Marshall <hubcap@omnibond.com>,
 linux-xfs@vger.kernel.org, linux-nilfs@vger.kernel.org,
 Yue Hu <zbestahu@gmail.com>, Miklos Szeredi <miklos@szeredi.hu>,
 samba-technical@lists.samba.org, Richard Weinberger <richard@nod.at>,
 Mark Fasheh <mark@fasheh.com>, Hugh Dickins <hughd@google.com>,
 Dai Ngo <Dai.Ngo@oracle.com>, Ryusuke Konishi <konishi.ryusuke@gmail.com>,
 Christoph Hellwig <hch@infradead.org>, Viacheslav Dubeyko <slava@dubeyko.com>,
 NeilBrown <neil@brown.name>, Gao Xiang <xiang@kernel.org>,
 linux-ext4@vger.kernel.org, Salah Triki <salah.triki@gmail.com>,
 linux-mm@kvack.org, devel@lists.orangefs.org,
 Shyam Prasad N <sprasad@microsoft.com>,
 Olga Kornievskaia <okorniev@redhat.com>, linux-cifs@vger.kernel.org,
 Dave Kleikamp <shaggy@kernel.org>, linux-nfs@vger.kernel.org,
 Tom Talpey <tom@talpey.com>, ocfs2-devel@lists.linux.dev,
 Bharath SM <bharathsm@microsoft.com>, David Sterba <dsterba@suse.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Jeffle Xu <jefflexu@linux.alibaba.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 ceph-devel@vger.kernel.org, Ilya Dryomov <idryomov@gmail.com>,
 OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
 Andreas Gruenbacher <agruenba@redhat.com>, gfs2@lists.linux.dev,
 Christian Brauner <brauner@kernel.org>, Theodore Tso <tytso@mit.edu>,
 Luis de Bethencourt <luisbg@kernel.org>,
 Joseph Qi <joseph.qi@linux.alibaba.com>, linux-erofs@lists.ozlabs.org,
 Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, Steve French <sfrench@samba.org>,
 Chuck Lever <chuck.lever@oracle.com>, Hongbo Li <lihongbo22@huawei.com>,
 Anna Schumaker <anna@kernel.org>, Jan Kara <jack@suse.com>,
 linux-fsdevel@vger.kernel.org, Phillip Lougher <phillip@squashfs.org.uk>,
 Andrew Morton <akpm@linux-foundation.org>, ntfs3@lists.linux.dev,
 David Woodhouse <dwmw2@infradead.org>, Trond Myklebust <trondmy@kernel.org>,
 Joel Becker <jlbec@evilplan.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gVGh1LCBKYW4gMTUsIDIwMjYgYXQgNzozMuKAr1BNIENodWNrIExldmVyIDxjZWxAa2VybmVs
Lm9yZz4gd3JvdGU6Cj4KPgo+Cj4gT24gVGh1LCBKYW4gMTUsIDIwMjYsIGF0IDE6MTcgUE0sIEFt
aXIgR29sZHN0ZWluIHdyb3RlOgo+ID4gT24gVGh1LCBKYW4gMTUsIDIwMjYgYXQgNjo0OOKAr1BN
IEplZmYgTGF5dG9uIDxqbGF5dG9uQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4+Cj4gPj4gSW4gcmVj
ZW50IHllYXJzLCBhIG51bWJlciBvZiBmaWxlc3lzdGVtcyB0aGF0IGNhbid0IHByZXNlbnQgc3Rh
YmxlCj4gPj4gZmlsZWhhbmRsZXMgaGF2ZSBncm93biBzdHJ1Y3QgZXhwb3J0X29wZXJhdGlvbnMu
IFRoZXkndmUgbW9zdGx5IGRvbmUKPiA+PiB0aGlzIGZvciBsb2NhbCB1c2UtY2FzZXMgKGVuYWJs
aW5nIG9wZW5fYnlfaGFuZGxlX2F0KCkgYW5kIHRoZSBsaWtlKS4KPiA+PiBVbmZvcnR1bmF0ZWx5
LCBoYXZpbmcgZXhwb3J0X29wZXJhdGlvbnMgaXMgZ2VuZXJhbGx5IHN1ZmZpY2llbnQgdG8gbWFr
ZQo+ID4+IGEgZmlsZXN5c3RlbSBiZSBjb25zaWRlcmVkIGV4cG9ydGFibGUgdmlhIG5mc2QsIGJ1
dCB0aGF0IHJlcXVpcmVzIHRoYXQKPiA+PiB0aGUgc2VydmVyIHByZXNlbnQgc3RhYmxlIGZpbGVo
YW5kbGVzLgo+ID4KPiA+IFdoZXJlIGRvZXMgdGhlIHRlcm0gInN0YWJsZSBmaWxlIGhhbmRsZXMi
IGNvbWUgZnJvbT8gYW5kIHdoYXQgZG9lcyBpdCBtZWFuPwo+ID4gV2h5IG5vdCAicGVyc2lzdGVu
dCBoYW5kbGVzIiwgd2hpY2ggaXMgZGVzY3JpYmVkIGluIE5GUyBhbmQgU01CIHNwZWNzPwo+ID4K
PiA+IE5vdCB0byBtZW50aW9uIHRoYXQgRVhQT1JUX09QX1BFUlNJU1RFTlRfSEFORExFUyB3YXMg
QWNrZWQKPiA+IGJ5IGJvdGggQ2hyaXN0b3BoIGFuZCBDaHJpc3RpYW46Cj4gPgo+ID4gaHR0cHM6
Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtZnNkZXZlbC8yMDI2MDExNS1ydW5kZ2FuZy1sZWloZ2Fi
ZS0xMjAxOGU5M2MwMGNAYnJhdW5lci8KPiA+Cj4gPiBBbSBJIG1pc3NpbmcgYW55dGhpbmc/Cj4K
PiBQRVJTSVNURU5UIGdlbmVyYWxseSBpbXBsaWVzIHRoYXQgdGhlIGZpbGUgaGFuZGxlIGlzIHNh
dmVkIG9uCj4gcGVyc2lzdGVudCBzdG9yYWdlLiBUaGlzIGlzIG5vdCB0cnVlIG9mIHRtcGZzLgoK
VGhhdCdzIG9uZSB3YXkgb2YgaW50ZXJwcmV0aW5nICJwZXJzaXN0ZW50Ii4KQW5vdGhlciB3YXkg
aXMgImNvbnRpbnVpbmcgdG8gZXhpc3Qgb3Igb2NjdXIgb3ZlciBhIHByb2xvbmdlZCBwZXJpb2Qu
Igp3aGljaCB3b3JrcyB3ZWxsIGZvciB0bXBmcyB0aGF0IGlzIG1vdW50ZWQgZm9yIGEgbG9uZyB0
aW1lLgoKQnV0IEkgYW0gY29uZnVzZWQsIGJlY2F1c2UgSSB3ZW50IGxvb2tpbmcgZm9yIHdoZXJl
IEplZmYgc2FpZCB0aGF0CnlvdSBzdWdnZXN0ZWQgc3RhYmxlIGZpbGUgaGFuZGxlcyBhbmQgdGhp
cyBpcyB3aGF0IEkgZm91bmQgdGhhdCB5b3Ugd3JvdGU6CgoidG1wZnMgZmlsZWhhbmRsZXMgYWxp
Z24gcXVpdGUgd2VsbCB3aXRoIHRoZSB0cmFkaXRpb25hbCBkZWZpbml0aW9uCiBvZiBwZXJzaXN0
ZW50IGZpbGVoYW5kbGVzLiB0bXBmcyBmaWxlaGFuZGxlcyBsaXZlIGFzIGxvbmcgYXMgdG1wZnMg
ZmlsZXMgZG8sCiBhbmQgdGhhdCBpcyBhbGwgdGhhdCBpcyByZXF1aXJlZCB0byBiZSBjb25zaWRl
cmVkICJwZXJzaXN0ZW50Ii4KCj4KPiBUaGUgdXNlIG9mICJzdGFibGUiIG1lYW5zIHRoYXQgdGhl
IGZpbGUgaGFuZGxlIGlzIHN0YWJsZSBmb3IKPiB0aGUgbGlmZSBvZiB0aGUgZmlsZS4gVGhpcyAv
aXMvIHRydWUgb2YgdG1wZnMuCgpJIGNhbiBsaXZlIHdpdGggU1RBQkxFX0hBTkRMRVMgSSBkb24n
dCBtaW5kIGFzIG11Y2gsCkkgdW5kZXJzdGFuZCB3aGF0IGl0IG1lYW5zLCBidXQgdGhlIGRlZmlu
aXRpb24gYWJvdmUgaXMgaW52ZW50ZWQsCndoZXJlYXMgdGhlIHRlcm0gcGVyc2lzdGVudCBoYW5k
bGVzIGlzIHdlbGwga25vd24gYW5kIHdlbGwgZGVmaW5lZC4KClRoYW5rcywKQW1pci4KCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRl
dmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApo
dHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRl
dmVsCg==
