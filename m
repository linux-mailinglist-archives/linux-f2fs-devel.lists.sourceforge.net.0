Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 744DD618AF7
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  3 Nov 2022 23:00:26 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oqiG5-00068l-Pf;
	Thu, 03 Nov 2022 22:00:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <vishal.moola@gmail.com>) id 1oqiFr-00068S-0d
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 03 Nov 2022 22:00:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BXMtoJhRlFWaQLcxjEM+qd1+6PF53F0Hz+I5xM4y+wc=; b=FOKU4ccV5hJls4ggoWvRfAdI8N
 zjyfD+Xc8Lh+T26LuSgBfeOAwSkzLCAXL+Dd0ETsEAv1rngSbtAwtQgK5Gbp++OSw08urPe/nSxJz
 BT6B+INduQcDUGe985YCExJJP1JxVYy2Eu59uz09GWi1oyzt7CawQumhAGvPwc9/SJL4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=BXMtoJhRlFWaQLcxjEM+qd1+6PF53F0Hz+I5xM4y+wc=; b=VsMzuMclV7soG5j2DBxyVs+R0F
 yY+G4Hem+5UPVq4reF/O68HKoV4xsj24kYICpXg62x5AEd7zMmlj6jZTyyqbYnsdj6rxyORGwVVQX
 zwTscPpNy2ytxxkdji7TFxwLk+VDDmuLY1fw2xDIIDlxRJB5c/n/a5C20rTcm/WBZti0=;
Received: from mail-pj1-f48.google.com ([209.85.216.48])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1oqiFn-00B4F5-9Y for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 03 Nov 2022 22:00:03 +0000
Received: by mail-pj1-f48.google.com with SMTP id
 m14-20020a17090a3f8e00b00212dab39bcdso6603923pjc.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 03 Nov 2022 15:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=BXMtoJhRlFWaQLcxjEM+qd1+6PF53F0Hz+I5xM4y+wc=;
 b=LSzE9TH+osvipk73Jg9gpor1ZQe37FTuPrWQ5VUxQIsLQ//7XAFuJQM1KyFIXYAxqx
 BE4yzuk+xifeQgNpMYonk3DPgvpHS7XYbgoNdLomm2aKEkQCHaH0Bc7mrZFzL+9j5ZSy
 b9DDF8m1+3bfZ9iV0lucJ1MqhbByVhp5MZXMvkd4dpduipcwth1ZiKn90EGRhJ8R9r+m
 EJ4boWxUG+nQ4ooKm3DZioH6mkJd/Le4V3cgspEcIdaCLQDHg98SssmSluKeW2l4jPay
 g1Az1Lvo9oZjC2k1yTkOvtryQxynTaEzmqQoj8oo4NJhMXBQYq056FnhoGgEMPlBjEct
 OTAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BXMtoJhRlFWaQLcxjEM+qd1+6PF53F0Hz+I5xM4y+wc=;
 b=3Nt/X2cN8faIdpPgvrEDgGxQWfknDW6DtOWJJn+b/BxK5TGy1m71sHQfs3B2myBshd
 vN3FVZFK8qAYCsS4mNO/paANAMKV4gTR33yekLaOT1pOD1GoKQwIlkgr0IDymPgBsPai
 GjhXuoaQfeEdFdO2UCcrwHmD6wuIlah9ry/i7PsyutEcGvIsnKxVNMM0whNdPq3Vo55/
 aJyzlYxqQCmhUrWgq5+s0zQWNykoPQpwnm2qpNzgZca/DOg50f8o2T59PVXSfAVL7E4N
 7lQZ7zeKIs1UJFZjBNPTVlQ4Q3MeQOagd7IFyv2euOQEX2YP89qoWQScR/Nxmh8k60+n
 NFLA==
X-Gm-Message-State: ACrzQf0p/oU7OuNpwgr+Ghm/X2YU4YGPlkP0eBriwjnqgmirlyXBoz+z
 irEnq3Pfj5/xA5To7/K7+/YcfpKGzhCbCg==
X-Google-Smtp-Source: AMsMyM7bULDdaNCNh0UvTT4e4bGiz6aC/rB81Sbmms9IVmh3til4gq09VVgLdxxc7KpN8RZNvnj8Zw==
X-Received: by 2002:a17:90b:1c10:b0:213:1bb8:feb with SMTP id
 oc16-20020a17090b1c1000b002131bb80febmr49947295pjb.214.1667512797631; 
 Thu, 03 Nov 2022 14:59:57 -0700 (PDT)
Received: from fedora ([2601:644:8002:1c20::8080])
 by smtp.gmail.com with ESMTPSA id
 123-20020a621781000000b00562784609fbsm1184991pfx.209.2022.11.03.14.59.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Nov 2022 14:59:57 -0700 (PDT)
Date: Thu, 3 Nov 2022 14:59:54 -0700
From: Vishal Moola <vishal.moola@gmail.com>
To: Dave Chinner <david@fromorbit.com>
Message-ID: <Y2Q52uQGoqGM4o9m@fedora>
References: <20220901220138.182896-1-vishal.moola@gmail.com>
 <20221018214544.GI2703033@dread.disaster.area>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221018214544.GI2703033@dread.disaster.area>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Oct 19, 2022 at 08:45:44AM +1100, Dave Chinner wrote:
 > On Thu, Sep 01, 2022 at 03:01:15PM -0700, Vishal Moola (Oracle) wrote:
 > > This patch series replaces find_get_pages_range_tag() with > [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.216.48 listed in list.dnswl.org]
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [vishal.moola[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.48 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1oqiFn-00B4F5-9Y
Subject: Re: [f2fs-dev] [PATCH 00/23] Convert to filemap_get_folios_tag()
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
Cc: linux-cifs@vger.kernel.org, David Howells <dhowells@redhat.com>,
 linux-nilfs@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
 linux-mm@kvack.org, linux-fsdevel@vger.kernel.org, ceph-devel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-afs@lists.infradead.org,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Oct 19, 2022 at 08:45:44AM +1100, Dave Chinner wrote:
> On Thu, Sep 01, 2022 at 03:01:15PM -0700, Vishal Moola (Oracle) wrote:
> > This patch series replaces find_get_pages_range_tag() with
> > filemap_get_folios_tag(). This also allows the removal of multiple
> > calls to compound_head() throughout.
> > It also makes a good chunk of the straightforward conversions to folios,
> > and takes the opportunity to introduce a function that grabs a folio
> > from the pagecache.
> > 
> > F2fs and Ceph have quite alot of work to be done regarding folios, so
> > for now those patches only have the changes necessary for the removal of
> > find_get_pages_range_tag(), and only support folios of size 1 (which is
> > all they use right now anyways).
> > 
> > I've run xfstests on btrfs, ext4, f2fs, and nilfs2, but more testing may be
> > beneficial.
> 
> Well, that answers my question about how filesystems that enable
> multi-page folios were tested: they weren't. 
> 
> I'd suggest that anyone working on further extending the
> filemap/folio infrastructure really needs to be testing XFS as a
> first priority, and then other filesystems as a secondary concern.
> 
> That's because XFS (via the fs/iomap infrastructure) is one of only
> 3 filesystems in the kernel (AFS and tmpfs are the others) that
> interact with the page cache and page cache "pages" solely via folio
> interfaces. As such they are able to support multi-page folios in
> the page cache. All of the tested filesystems still use the fixed
> PAGE_SIZE page interfaces to interact with the page cache, so they
> don't actually exercise interactions with multi-page folios at all.
> 

Thanks for the explanation! That makes perfect sense. I wholeheartedly
agree, and I'll be sure to test any future changes on XFS to try to
ensure multi-page folio functionality. 

I know David ran tests on AFS, so hopefully those hit multipage folios
well enough. But I'm not sure whether it was just for the AFS patch or
with the whole series applied. Regardless I'll run my own set of tests
on XFS and see if I run into any issues as well.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
