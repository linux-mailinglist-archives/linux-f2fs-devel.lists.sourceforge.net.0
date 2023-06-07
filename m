Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A36F5725B46
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  7 Jun 2023 12:08:21 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q6q5T-0005Qx-Dc;
	Wed, 07 Jun 2023 10:08:19 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jinpu.wang@ionos.com>) id 1q6q5N-0005Qh-8S
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 Jun 2023 10:08:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OKacAnva3Yv49FZ4mmigtapivvs6Pz0X+m8VvMKeakc=; b=Nevf3to7GF1qqegv1Co1kY0G1q
 6csrUVLxV7jRMRCzCwTj2O9zhYTW26iZaSXzKWGd4fIqjnh82XjTaURcDhD3R6XTCOACSKt3fwI+c
 2DzJE16Gdc6kAEyrhHfeK1CYIlzXkWzuw5hn1HIzI+g8OnXhZ31aRBoXKVxLk5CPnQHY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=OKacAnva3Yv49FZ4mmigtapivvs6Pz0X+m8VvMKeakc=; b=L7lY1Eo/EQMLmZ579MJ7vlAzHA
 Y3MhKHCcEFmCxlWyI5/LZ2XgWc0umeo8uQfOBMCi65fmVPHYfrSJvcoN+gXDdomw2WEMPmtrM4r5b
 gOypuGn4jM3Xuq1ISKpKitUSnqlbU7faxTVwnlsQtsOnkmF2OqaPHukNLTz3S/PK5LyQ=;
Received: from mail-lf1-f47.google.com ([209.85.167.47])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1q6q5L-00DaPy-9t for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 Jun 2023 10:08:13 +0000
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-4f6255ad8aeso4476220e87.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 07 Jun 2023 03:08:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ionos.com; s=google; t=1686132484; x=1688724484;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OKacAnva3Yv49FZ4mmigtapivvs6Pz0X+m8VvMKeakc=;
 b=NLwRdgVXSAarasJ7pR+pxFxuojkR9wYQU6lU9COWdnqSAV5zY3waz7u3breoK+hSxN
 UCoacfiAPm4b2BkPsfRA1gGbwfzF77i8jvP0nxwlwNm/4bgY2Tvlbi7Z+Bet2npKiChC
 fdMQ5ZmQIr5CJu0hgo42mKTzFTtCFclxZGps1tBy+f7RedJzLE1NvvBeehuG2nvu0D6k
 X+rb/Q3WDsXYrKvVmgnihmkUirx39tfHkg55x0e1Rs1neDckGZIw9BCWMdKDAPGntoSp
 APu/Mj6ilLJB+kv1Q8kCkebdBNE3997XnebGjrepGh9SSt61lrKAuR2K1ZKtAqLGJH02
 TiQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686132484; x=1688724484;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OKacAnva3Yv49FZ4mmigtapivvs6Pz0X+m8VvMKeakc=;
 b=DOxJCbb7I/Mn4+/g74fUtPho1N6+dnajSryziJUL5pISWXj0eWQb0gbQkEe8FAboxv
 5QxxDtgXKV49OfPt01rFcdvQapYgbXpW0uPbP38F4t9UtQ8SnWrEO3xXQyn355J8RFrK
 cdUP7ax7dtbRjTiIBvwvelLa0R8B0EcKKJiC6kQ+MTYhWDcVMKkup6lzKlw7B0Yp5uG8
 5X2kifbNldd3cZeUuVbFNZMNONOOFssKrc0zDM6h4/brfov+lY7GwCBw/aKZ7BkyDtN2
 Q+NYr/28TIF1xZjo3DA9SgOYliS828VT0nnFO5dDlkl5VsN7a+M5rJq1AS3hvePr7pr+
 030g==
X-Gm-Message-State: AC+VfDy+vkah1vfvjsRhoyQ/IBlgU4d4VQl2wQ6EmMeuULzEFPIoqz12
 wEUBSfWC6fhqNaIxRH75O/YF5+2WZa+3JTdYem73fUX6jD39/SCl6kJjZQ==
X-Google-Smtp-Source: ACHHUZ6qGErDhBYRK2EQNWjsiTZgthNZdqE08xgi5M9Zl1p8ZDd17beUaKBrj0/jBLtUwBleXb1y7OCzWAlQzI4iqec=
X-Received: by 2002:aa7:c3c3:0:b0:516:3261:17d with SMTP id
 l3-20020aa7c3c3000000b005163261017dmr3772815edr.20.1686130811848; Wed, 07 Jun
 2023 02:40:11 -0700 (PDT)
MIME-Version: 1.0
References: <20230606073950.225178-1-hch@lst.de>
 <20230606073950.225178-17-hch@lst.de>
In-Reply-To: <20230606073950.225178-17-hch@lst.de>
Date: Wed, 7 Jun 2023 11:40:01 +0200
Message-ID: <CAMGffEkXqRMD3yeyjXzTn1ZyHnszmPhqRdP8eN12KXcTdz=9Xw@mail.gmail.com>
To: Christoph Hellwig <hch@lst.de>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Tue, Jun 6, 2023 at 9:40 AM Christoph Hellwig <hch@lst.de>
    wrote: > > The current interface for exclusive opens is rather confusing
   as it > requires both the FMODE_EXCL flag and a holder. Remove [...] 
 
 Content analysis details:   (-0.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.167.47 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.167.47 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1q6q5L-00DaPy-9t
Subject: Re: [f2fs-dev] [PATCH 16/31] block: use the holder as indication
 for exclusive opens
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
From: Jinpu Wang via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Jinpu Wang <jinpu.wang@ionos.com>
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-nvme@lists.infradead.org,
 Phillip Potter <phil@philpotter.co.uk>, Chris Mason <clm@fb.com>,
 dm-devel@redhat.com, "Md. Haris Iqbal" <haris.iqbal@ionos.com>,
 Pavel Machek <pavel@ucw.cz>, Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-nilfs@vger.kernel.org, linux-scsi@vger.kernel.org,
 Richard Weinberger <richard@nod.at>, linux-pm@vger.kernel.org,
 linux-um@lists.infradead.org, Josef Bacik <josef@toxicpanda.com>,
 Coly Li <colyli@suse.de>, linux-block@vger.kernel.org,
 linux-bcache@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>,
 David Sterba <dsterba@suse.com>, Jens Axboe <axboe@kernel.dk>,
 Christian Brauner <brauner@kernel.org>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gVHVlLCBKdW4gNiwgMjAyMyBhdCA5OjQw4oCvQU0gQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBs
c3QuZGU+IHdyb3RlOgo+Cj4gVGhlIGN1cnJlbnQgaW50ZXJmYWNlIGZvciBleGNsdXNpdmUgb3Bl
bnMgaXMgcmF0aGVyIGNvbmZ1c2luZyBhcyBpdAo+IHJlcXVpcmVzIGJvdGggdGhlIEZNT0RFX0VY
Q0wgZmxhZyBhbmQgYSBob2xkZXIuICBSZW1vdmUgdGhlIG5lZWQgdG8gcGFzcwo+IEZNT0RFX0VY
Q0wgYW5kIGp1c3Qga2V5IG9mZiB0aGUgZXhjbHVzaXZlIG9wZW4gb2ZmIGEgbm9uLU5VTEwgaG9s
ZGVyLgo+Cj4gRm9yIGJsa2Rldl9wdXQgdGhpcyByZXF1aXJlcyBhZGRpbmcgdGhlIGhvbGRlciBh
cmd1bWVudCwgd2hpY2ggcHJvdmlkZXMKPiBiZXR0ZXIgZGVidWcgY2hlY2tpbmcgdGhhdCBvbmx5
IHRoZSBob2xkZXIgYWN0dWFsbHkgcmVsZWFzZXMgdGhlIGhvbGQsCj4gYnV0IGF0IHRoZSBzYW1l
IHRpbWUgYWxsb3dzIHJlbW92aW5nIHRoZSBub3cgc3VwZXJmbHVvdXMgbW9kZSBhcmd1bWVudC4K
Pgo+IFNpZ25lZC1vZmYtYnk6IENocmlzdG9waCBIZWxsd2lnIDxoY2hAbHN0LmRlPgo+IC0tLQo+
ICBibG9jay9iZGV2LmMgICAgICAgICAgICAgICAgICAgICAgICB8IDM3ICsrKysrKysrKysrKysr
KystLS0tLS0tLS0tLS0KPiAgYmxvY2svZm9wcy5jICAgICAgICAgICAgICAgICAgICAgICAgfCAg
NiArKystLQo+ICBibG9jay9nZW5oZC5jICAgICAgICAgICAgICAgICAgICAgICB8ICA1ICsrLS0K
PiAgYmxvY2svaW9jdGwuYyAgICAgICAgICAgICAgICAgICAgICAgfCAgNSArKy0tCj4gIGRyaXZl
cnMvYmxvY2svZHJiZC9kcmJkX25sLmMgICAgICAgIHwgMjMgKysrKysrKysrKy0tLS0tLS0KPiAg
ZHJpdmVycy9ibG9jay9wa3RjZHZkLmMgICAgICAgICAgICAgfCAxMyArKysrKy0tLS0tCj4gIGRy
aXZlcnMvYmxvY2svcm5iZC9ybmJkLXNydi5jICAgICAgIHwgIDQgKy0tCkFja2VkLWJ5OiBKYWNr
IFdhbmcgPGppbnB1LndhbmdAaW9ub3MuY29tPiAjIGZvciBybmJkCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5n
IGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0
cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
