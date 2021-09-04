Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D005C4009CD
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  4 Sep 2021 06:40:39 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mMNTl-0001Wb-8K; Sat, 04 Sep 2021 04:40:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daeho43@gmail.com>) id 1mMNTj-0001WV-HR
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 04 Sep 2021 04:40:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dP+j4JXyDo34ICC3JmPP8rPqOyI1cAd3JzgpaFIRD4I=; b=B6Nqk2e9dOjPXaao2X8d/oTn20
 cXjfCcF64nr4YIjWesTY8MhbhpF6zFV8t13x6fVC6Ol1Jpmcp+mrDRiLtczO/ZNMTCvcQW33k2trh
 8F+3RjLrpVCtf4kCcFV4NQoJVc5WsXiWhQU5VK3TUJeZQXgki7CEZlSjXJ4jSh/lr4Rc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=dP+j4JXyDo34ICC3JmPP8rPqOyI1cAd3JzgpaFIRD4I=; b=QYyDUGwdFH6v4SSJoibp9T4TOM
 CWoZdsumxb9RMfqqkvMa0TzwIwGOBT6QQeO5YBmiyEVlcJJqkL5bKvhw1x6LEu8tVBOdMg9gIMvuY
 zmHi+TGMVXsjZgAfZ1J9xstkDjY5nCTddvjyfcXRGcypu6zapqIHNTzUdG6ITrK/ew6E=;
Received: from mail-lf1-f46.google.com ([209.85.167.46])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1mMNTi-00E1Cw-S5
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 04 Sep 2021 04:40:31 +0000
Received: by mail-lf1-f46.google.com with SMTP id p38so2418622lfa.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 03 Sep 2021 21:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dP+j4JXyDo34ICC3JmPP8rPqOyI1cAd3JzgpaFIRD4I=;
 b=jExnvpX8lFUG+gFgfft7gQUua/drCkukHXU314B7Yaw5h0DOnJPIyq1vOlCo4wHgWH
 IkTMCVnUwZUOsT1VCqfmOfzryoXk52iYIModjiklCYFwhO5PofuenJPYnTOO6RTAFz/p
 oRbH1lqc3K7JNqoAEaycoK9ux2QIgeeo9htBfCn12P2pJ4+wIMJyywsbnXpJbqAtJ2T0
 BO6SG9vsDTU9GxRpc9MkMFfZMCyR9WDtsoaiwqutAbGbF6jGXtwywDt/jNp6yOQjmRAt
 bBN1K3f6pL3RyqdEWZYIwBEyl7IOeJj+3J5PScHpsrjpPiIv6TSfUN/yfx9I+FmsFOAz
 wtLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dP+j4JXyDo34ICC3JmPP8rPqOyI1cAd3JzgpaFIRD4I=;
 b=qgDBj3+Yr/Eqz/WoGDMj8XP0lm1Gha5fFo+vlK1HLglRplWjY5NEme3vi+3PDUJiOn
 WEdMPbAvuhs9GYlqX/5zmvkvGBdsgEMhOvI+qizKSKZLnJa3x8TGTbJ6Gacci0DcW03J
 9y/ieWs2eJW5xxtj2sWDmSoWdRXEmW+oQEeI5mjqiMq1CeK45ujS8Dq+P6xbE/Gqb5eC
 uBmAA2z3wqtQtMkh9lH4TWC8WKbX/c0F/kTHY0dkJdzKS3aocmgw5faBeMR/KKl9KDTK
 wR62uYGVuFooyaBKU1UnoND1s8/TOMrCuOBhpv+3jryREnE1QGP7QaTKvgcVb9vH18Aq
 NEnQ==
X-Gm-Message-State: AOAM532oGHcY871yhoBK71pLbVhQ6Eluh4Sdl5IVt7Q3CYyAEcVpp7o7
 0PiMrjh9jeU+/IW6I+/v+osofLAl47IyTSpBxpM=
X-Google-Smtp-Source: ABdhPJxtE7a+pXHA9vv/DbRTQSMp2yIwkyjcLIa/2qvDD7Gt6Tv7i3FVAXf9SprNaomxYhPXYcEsQuyORGLdeKpzOjo=
X-Received: by 2002:a05:6512:1189:: with SMTP id
 g9mr1825764lfr.26.1630730424284; 
 Fri, 03 Sep 2021 21:40:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210902172404.3517626-1-daeho43@gmail.com>
 <9ab17089-accc-c3a3-a5dc-007fc4eeaa20@kernel.org>
 <CACOAw_yovM592K3-2fQzA6M29XqWu8s_2f+zXawKo-QpNSXq0w@mail.gmail.com>
 <8f8e4695-4062-60c4-0f91-2a1f6a5b0a11@kernel.org>
In-Reply-To: <8f8e4695-4062-60c4-0f91-2a1f6a5b0a11@kernel.org>
From: Daeho Jeong <daeho43@gmail.com>
Date: Fri, 3 Sep 2021 21:40:13 -0700
Message-ID: <CACOAw_yBYZzUVGV-A7K57zqrcAaZv7nFSk9mSj9AC6jTTeU7Vw@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  > As a per curseg field. > > > Maybe, we run into the same
 race condition issue you told before for > > fragment_remained_chunk. > >
 Could you clarify this more? > > e.g. > > F2FS_OPTION(sbi).fs_mode [...] 
 Content analysis details:   (0.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.46 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.167.46 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [daeho43[at]gmail.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [daeho43[at]gmail.com]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1mMNTi-00E1Cw-S5
Subject: Re: [f2fs-dev] [PATCH v4] f2fs: introduce fragment allocation mode
 mount option
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
Cc: Daeho Jeong <daehojeong@google.com>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

> As a per curseg field.
>
> > Maybe, we run into the same race condition issue you told before for
> > fragment_remained_chunk.
> > Could you clarify this more?
>
> e.g.
>
> F2FS_OPTION(sbi).fs_mode = FS_MODE_FRAGMENT_FIXED_BLK
> fragment_chunk_size = 384
> fragment_hole_size = 384
>
> When creating hole:
>
> - f2fs_allocate_data_block
>   - __refresh_next_blkoff
>     chunk locates in [0, 383] of current segment
>     seg->next_blkoff = 384
>     sbi->fragment_remained_chunk = 0
>     then we will reset sbi->fragment_remained_chunk to 384
>     and move seg->next_blkoff forward to 768 (384 + 384)
>   - __has_curseg_space() returns false
>   - allocate_segment() allocates new current segment
>
> So, for such case that hole may cross two segments, hole size may be truncated
> to left size of previous segment.

First, sbi->fragment_remained_chunk should be seg->fragment_remained_chunk.
I understand what you mean, so you mean we need to take the leftover
"hole" size over to the next segment?
In the example, the leftover hole size will be (384 - (512-384)). Do
you want to take this over to the next segment?


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
