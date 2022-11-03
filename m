Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A63D6184DF
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  3 Nov 2022 17:39:16 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oqdFH-0001Zd-OY;
	Thu, 03 Nov 2022 16:39:11 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <vishal.moola@gmail.com>) id 1oqdFF-0001ZX-DK
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 03 Nov 2022 16:39:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Kh3PemVjLOMzD+zXkDJxoTeXa2tk+grc1up9htYz3yQ=; b=b2OU3lgTpjt/uePEXEI/TIkJ1P
 A3fiJfa3kg6dzFzX5av8peQ0WCJKb4A4q6MaIgEUf/lzxizEp4fqJ1RrjnxzCDVXUUKCXmrBIeE82
 MEAZqtb4+zemIV6mu+5UOmp0oDsK/p96140zd2jbBN31faWASdg8cpN1DAhkRtc+9G3o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Kh3PemVjLOMzD+zXkDJxoTeXa2tk+grc1up9htYz3yQ=; b=E61wl8gfBl2wREnyemadm77+xc
 YSf4sHbHUP325xfVG/2wrjibPYlf7SEZUX6aVyN22bcntz6cC9oOIc/t+BU+e57O58mplIGGUdqWv
 0k+7MhSyE4iwKsuuZF1tRUiNv3MAUkbwpMQWzYr5x9eGZrtKdeubZHJyzkympzLcAmzA=;
Received: from mail-yw1-f180.google.com ([209.85.128.180])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1oqdFA-0002g2-Vo for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 03 Nov 2022 16:39:09 +0000
Received: by mail-yw1-f180.google.com with SMTP id
 00721157ae682-37063f855e5so20844447b3.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 03 Nov 2022 09:39:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Kh3PemVjLOMzD+zXkDJxoTeXa2tk+grc1up9htYz3yQ=;
 b=TBUw7q9qlHT6DGo5HjKtvBxbUDq+n/istEJfhP3bgdU7CnHlK014WON/49qdO7GgS+
 RgxuEN4xbsVF7yK92hmPq+KFzPCfizitf30Jyy5THmkvmvJcf0/AenZJFlTbQOqSaq9t
 mt1fJeTL3SuDAdWBYqrwg+1xS+WwZ0rGkiDIYgN5vnd5oSRNmVoGDw8IxRuWD8Fzi2/s
 WKOAZr7nTjLUCxj01UWCWqYIS/ToOImwMXp0M0aSr7A6X9lD8R+BB9I11dD3UTwY7BMb
 dzvLL11zwCIl9tqMPcVFQSAnwW5T4pu4XVePASsS/ZkKBRZ/zUD8v1hoebUdaSPZeMuh
 xGKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Kh3PemVjLOMzD+zXkDJxoTeXa2tk+grc1up9htYz3yQ=;
 b=SM61Zn24m68oBNmk2rS6tM/SVTSXOzBZYEpRPhs+8U3ge9riXEbjlvQDD0SVE6NYD5
 lb0xqHYuJD8BFjO/7cogWBvw8WYkeCYFcJCmlLTxnSD7592/yNR5wGQBPR14LtPWJxY0
 ZMbsuTYp9fknMGLuUu+LtpD6tdHO6PJknW2/sb9XQRQP8uEB9Myzqp/CyE69K3wkysHE
 AbZOwCUaubevUyy0x2uKuOLpzRm5hFk+p1VN8cVlszZhTfZ0DMcsj7iqf1iDyI++SZzW
 YMXV4PCrVotyL307TcF8MW1DykkSadZxlvpG0ydpqmWjhgIzUOKyVDXpcyOp+YDmGi/J
 XKsg==
X-Gm-Message-State: ACrzQf3FtkPIVOalrGvMqRbvuxjpbYQ0NPKShkav/TpUm/+lKeXC2F8z
 drKOzAoV8uLEE4/tfmb+K6CfEUbQdm6GrlSK2Es=
X-Google-Smtp-Source: AMsMyM6eD3AkR/tTwVJuSGW1VpJEcDm8gRAUUIITH99yEF6ks7q7BqgOP+0YDkckG+H0+22nmeoDoFNiML2RzB4TzPI=
X-Received: by 2002:a81:1648:0:b0:36b:1891:7dda with SMTP id
 69-20020a811648000000b0036b18917ddamr29441580yww.447.1667493539150; Thu, 03
 Nov 2022 09:38:59 -0700 (PDT)
MIME-Version: 1.0
References: <20221102161031.5820-1-vishal.moola@gmail.com>
 <20221103070807.GX2703033@dread.disaster.area>
In-Reply-To: <20221103070807.GX2703033@dread.disaster.area>
From: Vishal Moola <vishal.moola@gmail.com>
Date: Thu, 3 Nov 2022 09:38:48 -0700
Message-ID: <CAOzc2pzFMU-XiGZ9bsp40JkpYVSzQuxs2VXgfw_p9abkj4GrFw@mail.gmail.com>
To: Dave Chinner <david@fromorbit.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Nov 3, 2022 at 12:08 AM Dave Chinner wrote: > > On
 Wed, Nov 02, 2022 at 09:10:08AM -0700, Vishal Moola (Oracle) wrote: > > This
 patch series replaces find_get_pages_range_tag() with > > file [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [vishal.moola[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.180 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.128.180 listed in list.dnswl.org]
X-Headers-End: 1oqdFA-0002g2-Vo
Subject: Re: [f2fs-dev] [PATCH v4 00/23] Convert to filemap_get_folios_tag()
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
Cc: linux-cifs@vger.kernel.org, linux-nilfs@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 cluster-devel@redhat.com, linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
 ceph-devel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-afs@lists.infradead.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Nov 3, 2022 at 12:08 AM Dave Chinner <david@fromorbit.com> wrote:
>
> On Wed, Nov 02, 2022 at 09:10:08AM -0700, Vishal Moola (Oracle) wrote:
> > This patch series replaces find_get_pages_range_tag() with
> > filemap_get_folios_tag(). This also allows the removal of multiple
> > calls to compound_head() throughout.
> > It also makes a good chunk of the straightforward conversions to folios,
> > and takes the opportunity to introduce a function that grabs a folio
> > from the pagecache.
> >
> > F2fs and Ceph have quite a lot of work to be done regarding folios, so
> > for now those patches only have the changes necessary for the removal of
> > find_get_pages_range_tag(), and only support folios of size 1 (which is
> > all they use right now anyways).
> >
> > I've run xfstests on btrfs, ext4, f2fs, and nilfs2, but more testing may be
> > beneficial. The page-writeback and filemap changes implicitly work. Testing
> > and review of the other changes (afs, ceph, cifs, gfs2) would be appreciated.
>
> Same question as last time: have you tested this with multipage
> folios enabled? If you haven't tested XFS, then I'm guessing the
> answer is no, and you haven't fixed the bug I pointed out in
> the write_cache_pages() implementation....
>

I haven't tested the series with multipage folios or XFS.

I don't seem to have gotten your earlier comments, and I
can't seem to find them on the mailing lists. Could you
please send them again so I can take a look?


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
