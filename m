Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 58C23777E71
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 10 Aug 2023 18:39:44 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qU8hC-0002gj-Cn;
	Thu, 10 Aug 2023 16:39:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <konishi.ryusuke@gmail.com>) id 1qU8hB-0002gd-Bk
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 10 Aug 2023 16:39:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PiiUXlYJ8bvDKMXQX0ZpS7OfVahtG1U2z1S893Hu6ZU=; b=QIqh8nmzgTsXyQvjzmcjFyyMqB
 2Zi9T+WajI5C3PN8OV14mf853Y4dw2WKQpwz1/LVtej30Wq5wjysyQsA5+7HZZntFFaihcjCFCKwX
 hGgDU24yZ+LVpsRA30sCkU3mtMmNLGVtrGI1kBFNbQJ8oLTcOV327G19fA9fPfkXZ3Qk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=PiiUXlYJ8bvDKMXQX0ZpS7OfVahtG1U2z1S893Hu6ZU=; b=ldXjj4IYk7BPLrpUg8l6WUrlYM
 UXW30F/MnkAKzI0rSEO4WuCyC48uJ0XgqII184uhcp2+zpAItP94oBn1aPtAEFssJ+MCwcUiOk/ba
 dOcFQyLHmg4JoZvKGHnfyJ9ojg0spdbSYzft1IvLZpxbUB7Gd++g/HiOdWcsRe0P1PGw=;
Received: from mail-ua1-f42.google.com ([209.85.222.42])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qU8hB-0002Zb-NS for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 10 Aug 2023 16:39:34 +0000
Received: by mail-ua1-f42.google.com with SMTP id
 a1e0cc1a2514c-79a41b1bccfso359990241.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 10 Aug 2023 09:39:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691685568; x=1692290368;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PiiUXlYJ8bvDKMXQX0ZpS7OfVahtG1U2z1S893Hu6ZU=;
 b=MRHaf2nEjiv5t5Q5zoZ0UefIWXOkWjR11SdaXVYzelWOneebbVCB3cHeCHu/l1S4aj
 tZHdJB4H0OWjl7w7FiTUQGuIsJFhmgFe9Nf/3Rj2u4tIfahYGZv2GbnKN/mltO2q60wZ
 sTV15EDdCdTHliC4RYvxDLyHniXcvUYzLvIubBiAWaA4poKsO7WCLJyOZrRshvRGVmq+
 ldlHhJOLuZBMe0jCvT5Q3ASTyW930C9fQWLpIasD6NAs0tKU8RMNdxrQLFjOPFFsUGgG
 T5y8zxlLG/LOjUIhGzDECYXnHbt7WtuLnsX6kIAwDmkpVskifAA9mmVp4qxX+knQr+P6
 sAXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691685568; x=1692290368;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PiiUXlYJ8bvDKMXQX0ZpS7OfVahtG1U2z1S893Hu6ZU=;
 b=G7oBn617Szd1jll4O/5FWdBCWmH8X8jOkvFu905wQuAaLANR1S6Jm2ImYBedMQm/o4
 eEiksrEK5vVPpoOQknq6YmVDhN28z23EqjyT+GPLGrRjfRpRp6yzQFAljDWqMj2AbKGE
 1LwJOrm8zBwedQ/hwyc3DI1w++97x3eoY2Pzmy9MgnTMSxLDWaAwEoOSPCgrpq2O6YN/
 lIpoBg77mo48gSMAr7quei3gjjROANTmP+uzYUM66/2lIf3CNyLw8ITIXD4GnebTNTpn
 deRHphfb54lUm7+bkWL7CBWuGncj3Q7xK+M8qNXYOvoCPBZbclkj6O/sKYOnywGLQgQa
 fSXw==
X-Gm-Message-State: AOJu0YxNnH1seO99KJpGFcTJIm+t3aMDR3pDgtD1NPk0TrcuWl0jNf6D
 1RWlNgGJuaGUq7J2pYDBvaCjhhh+x9z+O6Xl9h0=
X-Google-Smtp-Source: AGHT+IGrX1ae/kXMdBqblfeIEI/NiLvob99ua2FBeyd4WVGKXISuhSkW8yHD7vYRNdG1Oh0tfwTkI8jasKFCVAxJC6A=
X-Received: by 2002:a05:6102:498:b0:43d:6660:581b with SMTP id
 n24-20020a056102049800b0043d6660581bmr2236672vsa.5.1691685567696; Thu, 10 Aug
 2023 09:39:27 -0700 (PDT)
MIME-Version: 1.0
References: <20230802154131.2221419-1-hch@lst.de>
 <20230802154131.2221419-3-hch@lst.de>
 <20230803114651.ihtqqgthbdjjgxev@quack3>
 <CAKFNMomzHg33SHnp6xGMEZY=+k6Y4t7dvBvgBDbO9H3ujzNDCw@mail.gmail.com>
 <20230810110547.ks62g2flysgwpgru@quack3>
In-Reply-To: <20230810110547.ks62g2flysgwpgru@quack3>
From: Ryusuke Konishi <konishi.ryusuke@gmail.com>
Date: Fri, 11 Aug 2023 01:39:10 +0900
Message-ID: <CAKFNMon_3A7dC+k1q_RjEnoXXNtxBJAUQud_FD4s4VrHZdCVzg@mail.gmail.com>
To: Jan Kara <jack@suse.cz>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Thu, Aug 10, 2023 at 8:05 PM Jan Kara wrote: > > On Fri
    04-08-23 11:01:39, Ryusuke Konishi wrote: > > On Thu, Aug 3, 2023 at 8:46 PM
    Jan Kara wrote: > > > > > > On Wed 02-08-23 17:41:21, Christ [...] 
 
 Content analysis details:   (-0.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.222.42 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [konishi.ryusuke[at]gmail.com]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.222.42 listed in wl.mailspike.net]
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
X-Headers-End: 1qU8hB-0002Zb-NS
Subject: Re: [f2fs-dev] [PATCH 02/12] nilfs2: use setup_bdev_super to
 de-duplicate the mount code
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
Cc: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
 Christian Brauner <brauner@kernel.org>, linux-nilfs@vger.kernel.org,
 Theodore Ts'o <tytso@mit.edu>, linux-fsdevel@vger.kernel.org,
 "Darrick J. Wong" <djwong@kernel.org>, Josef Bacik <josef@toxicpanda.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 Chris Mason <clm@fb.com>, Andreas Dilger <adilger.kernel@dilger.ca>,
 Al Viro <viro@zeniv.linux.org.uk>, David Sterba <dsterba@suse.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-ext4@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gVGh1LCBBdWcgMTAsIDIwMjMgYXQgODowNeKAr1BNIEphbiBLYXJhIHdyb3RlOgo+Cj4gT24g
RnJpIDA0LTA4LTIzIDExOjAxOjM5LCBSeXVzdWtlIEtvbmlzaGkgd3JvdGU6Cj4gPiBPbiBUaHUs
IEF1ZyAzLCAyMDIzIGF0IDg6NDbigK9QTSBKYW4gS2FyYSB3cm90ZToKPiA+ID4KPiA+ID4gT24g
V2VkIDAyLTA4LTIzIDE3OjQxOjIxLCBDaHJpc3RvcGggSGVsbHdpZyB3cm90ZToKPiA+ID4gPiBV
c2UgdGhlIGdlbmVyaWMgc2V0dXBfYmRldl9zdXBlciBoZWxwZXIgdG8gb3BlbiB0aGUgbWFpbiBi
bG9jayBkZXZpY2UKPiA+ID4gPiBhbmQgZG8gdmFyaW91cyBiaXRzIG9mIHN1cGVyYmxvY2sgc2V0
dXAgaW5zdGVhZCBvZiBkdXBsaWNhdGluZyB0aGUKPiA+ID4gPiBsb2dpYy4gIFRoaXMgaW5jbHVk
ZXMgbW92aW5nIHRvIHRoZSBuZXcgc2NoZW1lIGltcGxlbWVudGVkIGluIGNvbW1vbgo+ID4gPiA+
IGNvZGUgdGhhdCBvbmx5IG9wZW5zIHRoZSBibG9jayBkZXZpY2UgYWZ0ZXIgdGhlIHN1cGVyYmxv
Y2sgaGFzIGFsbG9jYXRlZC4KPiA+ID4gPgo+ID4gPiA+IEl0IGRvZXMgbm90IHlldCBjb252ZXJ0
IG5pbGZzMiB0byB0aGUgbmV3IG1vdW50IEFQSSwgYnV0IGRvaW5nIHNvIHdpbGwKPiA+ID4gPiBi
ZWNvbWUgYSBiaXQgc2ltcGxlciBhZnRlciB0aGlzIGZpcnN0IHN0ZXAuCj4gPiA+ID4KPiA+ID4g
PiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxzdC5kZT4KPiA+ID4KPiA+
ID4gQUZBSUNTIG5pbGZzMiBjb3VsZCAqYWxtb3N0KiB1c2UgbW91bnRfYmRldigpIGRpcmVjdGx5
IGFuZCB0aGVuIGp1c3QgZG8gaXRzCj4gPgo+ID4gPiBzbmFwc2hvdCB0aGluZyBhZnRlciBtb3Vu
dF9iZGV2KCkgcmV0dXJucy4gQnV0IGl0IGhhcyB0aGlzIHdlaXJkIGxvZ2ljCj4gPiA+IHRoYXQ6
ICJpZiB0aGUgc3VwZXJibG9jayBpcyBhbHJlYWR5IG1vdW50ZWQgYnV0IHdlIGNhbiBzaHJpbmsg
dGhlIHdob2xlCj4gPiA+IGRjYWNoZSwgdGhlbiBkbyByZW1vdW50IGluc3RlYWQgb2YgaWdub3Jp
bmcgbW91bnQgb3B0aW9ucyIuIEZpcnN0bHksIHRoaXMKPiA+ID4gbG9va3MgcmFjeSAtIHdoYXQg
cHJldmVudHMgc29tZW9uZSBmcm9tIHNheSBvcGVuaW5nIGEgZmlsZSBvbiB0aGUgc2IganVzdAo+
ID4gPiBhZnRlciBuaWxmc190cmVlX2lzX2J1c3koKSBzaHJpbmtzIGRjYWNoZT8gU2Vjb25kbHks
IGl0IGlzIGluY29uc2lzdGVudAo+ID4gPiB3aXRoIGFueSBvdGhlciBmaWxlc3lzdGVtIHNvIGl0
J3MgZ29pbmcgdG8gc3VycHJpc2Ugc3lzYWRtaW5zIG5vdAo+ID4gPiBpbnRpbWF0ZWx5IGtub3dp
bmcgbmlsZnMyLiBUaGlyZGx5LCBmcm9tIHVzZXJzcGFjZSB5b3UgY2Fubm90IHRlbGwgd2hhdAo+
ID4gPiB5b3VyIG1vdW50IGNhbGwgaXMgZ29pbmcgdG8gZG8uIExhc3QgYnV0IG5vdCBsZWFzdCwg
d2hhdCBpcyBpdCByZWFsbHkgZ29vZAo+ID4gPiBmb3I/IFJ5dXN1a2UsIGNhbiB5b3UgZXhwbGFp
biBwbGVhc2U/Cj4gPiA+Cj4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBIb256YQo+ID4KPiA+IEkgdGhpbmsgeW91IGFy
ZSByZWZlcnJpbmcgdG8gdGhlIGZvbGxvd2luZyBwYXJ0Ogo+ID4KPiA+ID4gICAgICAgIGlmICgh
cy0+c19yb290KSB7Cj4gPiAuLi4KPiA+ID4gICAgICAgIH0gZWxzZSBpZiAoIXNkLmNubykgewo+
ID4gPiAgICAgICAgICAgICAgICBpZiAobmlsZnNfdHJlZV9pc19idXN5KHMtPnNfcm9vdCkpIHsK
PiA+ID4gICAgICAgICAgICAgICAgICAgICAgICBpZiAoKGZsYWdzIF4gcy0+c19mbGFncykgJiBT
Ql9SRE9OTFkpIHsKPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG5pbGZzX2Vy
cihzLAo+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICJ0aGUg
ZGV2aWNlIGFscmVhZHkgaGFzIGEgJXMgbW91bnQuIiwKPiA+ID4gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBzYl9yZG9ubHkocykgPyAicmVhZC1vbmx5IiA6ICJyZWFk
L3dyaXRlIik7Cj4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBlcnIgPSAtRUJV
U1k7Cj4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBnb3RvIGZhaWxlZF9zdXBl
cjsKPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICB9Cj4gPiA+ICAgICAgICAgICAgICAgIH0g
ZWxzZSB7Cj4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgLyoKPiA+ID4gICAgICAgICAgICAg
ICAgICAgICAgICAgKiBUcnkgcmVtb3VudCB0byBzZXR1cCBtb3VudCBzdGF0ZXMgaWYgdGhlIGN1
cnJlbnQKPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgKiB0cmVlIGlzIG5vdCBtb3VudGVk
IGFuZCBvbmx5IHNuYXBzaG90cyB1c2UgdGhpcyBzYi4KPiA+ID4gICAgICAgICAgICAgICAgICAg
ICAgICAgKi8KPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICBlcnIgPSBuaWxmc19yZW1vdW50
KHMsICZmbGFncywgZGF0YSk7Cj4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgaWYgKGVycikK
PiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGdvdG8gZmFpbGVkX3N1cGVyOwo+
ID4gPiAgICAgICAgICAgICAgICB9Cj4gPiA+ICAgICAgICB9Cj4gPgo+ID4gV2hhdCB0aGlzIGxv
Z2ljIGlzIHRyeWluZyB0byBkbyBpcywgaWYgdGhlcmUgaXMgYWxyZWFkeSBhIG5pbGZzMiBtb3Vu
dAo+ID4gaW5zdGFuY2UgZm9yIHRoZSBkZXZpY2UsIGFuZCBhcmUgdHJ5aW5nIHRvIG1vdW50aW5n
IHRoZSBjdXJyZW50IHRyZWUKPiA+IChzZC5jbm8gaXMgMCwgc28gdGhpcyBpcyBub3QgYSBzbmFw
c2hvdCBtb3VudCksIHRoZW4gd2lsbCBzd2l0Y2gKPiA+IGRlcGVuZGluZyBvbiB3aGV0aGVyIHRo
ZSBjdXJyZW50IHRyZWUgaGFzIGEgbW91bnQ6Cj4gPgo+ID4gLSBJZiB0aGUgY3VycmVudCB0cmVl
IGlzIG1vdW50ZWQsIGl0J3MganVzdCBsaWtlIGEgbm9ybWFsIGZpbGVzeXN0ZW0uCj4gPiAoQSBy
ZWFkLW9ubHkgbW91bnQgYW5kIGEgcmVhZC93cml0ZSBtb3VudCBjYW4ndCBjb2V4aXN0LCBzbyBj
aGVjawo+ID4gdGhhdCwgYW5kIHJldXNlIHRoZSBpbnN0YW5jZSBpZiBwb3NzaWJsZSkKPiA+IC0g
T3RoZXJ3aXNlLCBpLmUuIGZvciBzbmFwc2hvdCBtb3VudHMgb25seSwgZG8gd2hhdGV2ZXIgaXMg
bmVjZXNzYXJ5Cj4gPiB0byBhZGQgYSBuZXcgY3VycmVudCBtb3VudCwgc3VjaCBhcyBzdGFydGlu
ZyBhIGxvZyB3cml0ZXIuCj4gPiAgICBTaW5jZSBpdCBkb2VzIHRoZSBzYW1lIHRoaW5nIHRoYXQg
bmlsZnNfcmVtb3VudCBkb2VzLCBzbwo+ID4gbmlsZnNfcmVtb3VudCgpIGlzIHVzZWQgdGhlcmUu
Cj4gPgo+ID4gV2hldGhlciBvciBub3QgdGhlcmUgaXMgYSBjdXJyZW50IHRyZWUgbW91bnQgY2Fu
IGJlIGRldGVybWluZWQgYnkKPiA+IGRfY291bnQocy0+c19yb290KSA+IDEgYXMgbmlsZnNfdHJl
ZV9pc19idXN5KCkgZG9lcy4KPiA+IFdoZXJlIHMtPnNfcm9vdCBpcyBhbHdheXMgdGhlIHJvb3Qg
ZGVudHJ5IG9mIHRoZSBjdXJyZW50IHRyZWUsIG5vdAo+ID4gdGhhdCBvZiB0aGUgbW91bnRlZCBz
bmFwc2hvdC4KPgo+IEkgc2VlIG5vdywgdGhhbmtzIGZvciBleHBsYW5hdGlvbiEgQnV0IG9uZSB0
aGluZyBzdGlsbCBpcyBub3QgY2xlYXIgdG8gbWUuCj4gSWYgeW91IHNheSBoYXZlIGEgc25hcHNo
b3QgbW91bnRlZCByZWFkLXdyaXRlIGFuZCB0aGVuIHlvdSBtb3VudCB0aGUKPiBjdXJyZW50IHNu
YXBzaG90IChjbm8gPT0gMCkgcmVhZC1vbmx5LCB5b3UnbGwgc3dpdGNoIHRoZSB3aG9sZSBzdXBl
cmJsb2NrCj4gdG8gcmVhZC1vbmx5IHN0YXRlLiBTbyBhbHNvIHRoZSBtb3VudGVkIHNuYXBzaG90
IGlzIHN1ZGRlbnRseSByZWFkLW9ubHkKPiB3aGljaCBpcyB1bmV4cGVjdGVkIGFuZCBhY3R1YWxs
eSBzdXBwb3NlZGx5IGJyZWFrcyB0aGluZ3MgYmVjYXVzZSB5b3UgY2FuCj4gc3RpbGwgaGF2ZSBm
aWxlIGhhbmRsZXMgb3BlbiBmb3Igd3JpdGluZyBvbiB0aGUgc25hcHNob3QgZXRjLi4gU28gaG93
IGRvCj4geW91IHNvbHZlIHRoYXQ/Cj4KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgSG9uemEKCk9uZSB0aGluZyBJIGhhdmUg
dG8gdGVsbCB5b3UgYXMgYSBwcmVtaXNlIGlzIHRoYXQgbmlsZnMyJ3Mgc25hcHNob3QKbW91bnRz
IChjbm8gIT0gMCkgYXJlIHJlYWQtb25seS4KClRoZSByZWFkLW9ubHkgb3B0aW9uIGlzIG1hbmRh
dG9yeSBmb3IgbmlsZnMyIHNuYXBzaG90IG1vdW50cywgc28KcmVtb3VudGluZyB0byByZWFkL3dy
aXRlIG1vZGUgd2lsbCByZXN1bHQgaW4gYW4gZXJyb3IuClRoaXMgY29uc3RyYWludCBpcyBjaGVj
a2VkIGluIG5pbGZzX3BhcnNlX3NuYXBzaG90X29wdGlvbigpIHdoaWNoIGlzCmNhbGxlZCBmcm9t
IG5pbGZzX2lkZW50aWZ5KCkuCgpJbiBmYWN0LCBhbnkgd3JpdGUgbW9kZSBmaWxlL2lub2RlIG9w
ZXJhdGlvbnMgb24gYSBzbmFwc2hvdCBtb3VudCB3aWxsCnJlc3VsdCBpbiBhbiBFUk9GUyBlcnJv
ciwgcmVnYXJkbGVzcyBvZiB3aGV0aGVyIHRoZSBjb2V4aXN0aW5nIGN1cnJlbnQKdHJlZSBtb3Vu
dCBpcyByZWFkLW9ubHkgb3IgcmVhZC93cml0ZSAoaS5lLiByZWdhcmRsZXNzIG9mIHRoZQpyZWFk
LW9ubHkgZmxhZyBvZiB0aGUgc3VwZXJibG9jayBpbnN0YW5jZSkuCgpUaGlzIGlzIG1vc3RseSAo
YW5kIHBvc3NpYmx5IGVudGlyZWx5KSBhY2NvbXBsaXNoZWQgYXQgdGhlIHZmcyBsYXllcgpieSBj
aGVja2luZyB0aGUgTU5UX1JFQURPTkxZIGZsYWcgaW4gbW50X2ZsYWdzIG9mIHRoZSB2ZnNtb3Vu
dApzdHJ1Y3R1cmUsIGFuZCBldmVuIG9uIHRoZSBuaWxmczIgc2lkZSwgIGlvcHMtPnBlcm1pc3Np
b24KKD1uaWxmc19wZXJtaXNzaW9uKSByZWplY3RzIHdyaXRlIG9wZXJhdGlvbnMgb24gc25hcHNo
b3QgbW91bnRzLgoKVGhlcmVmb3JlLCB0aGUgcHJvYmxlbSB5b3UgcG9pbnRlZCBvdXQgc2hvdWxk
bid0IG9jY3VyIGluIHRoZSBmaXJzdApwbGFjZSBzaW5jZSB0aGUgc2l0dWF0aW9uIHdoZXJlIGEg
c25hcHNob3Qgd2l0aCBhIGhhbmRsZSBpbiB3cml0ZSBtb2RlCnN1ZGRlbmx5IGJlY29tZXMgcmVh
ZC1vbmx5IGRvZXNuJ3QgaGFwcGVuLiAgIFVubGVzcyBJJ20gbWlzc2luZwpzb21ldGhpbmcuLgoK
UmVnYXJkcywKUnl1c3VrZSBLb25pc2hpCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJm
cy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5u
ZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
