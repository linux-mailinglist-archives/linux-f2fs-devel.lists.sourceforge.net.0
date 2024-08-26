Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A70695F4C3
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 26 Aug 2024 17:11:53 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sibNb-00042a-O8;
	Mon, 26 Aug 2024 15:11:40 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <josef@toxicpanda.com>) id 1sibNX-00042O-EA
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 26 Aug 2024 15:11:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GV5lG+ZmIq1xOZJ846hJ9M+BmOAVFkfHIXGG4hkbdEc=; b=RnbvTdw9DbwApgCZ439y6sg7/F
 sAG5Iy01E+SyK+Kfj8uIRdgU1iaI21tjKtAWL3mADZyRzpvw1btJ1DG1Phh+W0DlfpHfJ5E0Gs++w
 gqI/obPzIZnHdNVfHsA+PzGTW8dNNYS0Mg8l9D7XMNGbrRcg5qGjG8QonRhmixjoLlMI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=GV5lG+ZmIq1xOZJ846hJ9M+BmOAVFkfHIXGG4hkbdEc=; b=SfZTKJuueteZ+9a/84OTCuuqJo
 XhkesSdtns7Jjq0M9jUSg5MrSFIZ7taxTRLrPHcdatKCJdCGKsXO6GVtM5Qks+MQmd0Gq64I3KbJg
 TCs6gAD55HJe1STZDO0sBuB1pCvYXS9Mk1Y5MFzUuUkMEWzJrkWo0jbTjJFnKPTaixF4=;
Received: from mail-yw1-f180.google.com ([209.85.128.180])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1sibNX-0005L8-Aa for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 26 Aug 2024 15:11:36 +0000
Received: by mail-yw1-f180.google.com with SMTP id
 00721157ae682-6c32daf0797so44131287b3.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 26 Aug 2024 08:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=toxicpanda-com.20230601.gappssmtp.com; s=20230601; t=1724685084; x=1725289884;
 darn=lists.sourceforge.net; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=GV5lG+ZmIq1xOZJ846hJ9M+BmOAVFkfHIXGG4hkbdEc=;
 b=ev8F/bEC+uVb3zaWfiApKaH54O+OCIonL/beiUCVwejp3m32qkzUpgGz++YMLIVon7
 OHgRYhKhFlw1uFgI43RvAF3vWMeuaNmUBQ0BKErKnzjo7OySYen+YE226Tel+g/RNnz8
 VtE1AzR4YcfsF3/hsKTpaAiCPFp5CHQqEKAdUo4/cd/a5YlHi46INajWLA7Q/VRvqFK7
 tMWd9wisQbmGmtpSTCaOjd01+qBeAGAcYSogRddL9HfnevwXQYpfQ70je2p8X4oP4JFh
 K7BuYEAePlVjJ1tUJaB3IRmGfnnYfDMH0XOXs0Aqe5lHwGNq8oCzOm3OvwqDEV/WHLQr
 nUfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724685084; x=1725289884;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GV5lG+ZmIq1xOZJ846hJ9M+BmOAVFkfHIXGG4hkbdEc=;
 b=q7U/CpCN53VS9fFLDbVNy6oBQxmUJ5vqPNxLp8taLI6Zr4iNjctqRsYg6hP0nJqU/7
 OyqPzG6EevExo5A2O+xwP1FRFvUeFLvLBSyCExAMT+APLAfd7v4RTF7Vye2dQNKBvh26
 PEybYL2Pk7kgqRHbTx+3jwzrrpDbEFb6Vdt5phzPFrwDXZnTHm4HIIfPL6flXLB8la7n
 kMARDzHPXMPvE54J95scWAHpgBRO3Le2kOamql9R199DxCa1D0VPvU7LfwVVd5NrZqhQ
 DmaF5bvIyTMF5psHarsBBKVcBLD4PhCAVh98HKjqr4uVoKP3oLwDekZH+fEaqm7HzxtS
 BJxA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWz1/n47QQBRYouxfnAcXtxT2se8ZL5vopdqs2jWHCH45V56+BUuIs/4jjYsC3XcZNX4cGHckSSEVIin9ww5LMW@lists.sourceforge.net
X-Gm-Message-State: AOJu0YxXoU6BQkP+FEnH9BhD/+DHl/LD7E1JOQ2gi/ScYB09m0Ai6Jh1
 E/t50c/odZ2UUKPcOqKyBe02CWC26qEMif/LUpq85gLYHbjoS20epmJ8/4TmG6ysGkKBhiUJ5z+
 2
X-Google-Smtp-Source: AGHT+IEfl39oZI31D86xNJOEhJWW2ikyPBsl4fMysjSYhPMRZGDNPry8iG+JXjxWSDfUlCHmH0bM0Q==
X-Received: by 2002:a05:6214:3f90:b0:6bf:66e6:476f with SMTP id
 6a1803df08f44-6c16dcc9108mr127120076d6.47.1724681300034; 
 Mon, 26 Aug 2024 07:08:20 -0700 (PDT)
Received: from localhost (syn-076-182-020-124.res.spectrum.com.
 [76.182.20.124]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6c162de7b1fsm46499926d6.138.2024.08.26.07.08.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Aug 2024 07:08:19 -0700 (PDT)
Date: Mon, 26 Aug 2024 10:08:18 -0400
From: Josef Bacik <josef@toxicpanda.com>
To: Li Zetao <lizetao1@huawei.com>
Message-ID: <20240826140818.GA2393039@perftesting>
References: <20240822013714.3278193-1-lizetao1@huawei.com>
 <20240823195051.GD2237731@perftesting>
 <20240823211522.GA2305223@perftesting>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240823211522.GA2305223@perftesting>
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, Aug 23, 2024 at 05:15:22PM -0400, Josef Bacik wrote:
 > On Fri, Aug 23, 2024 at 03:50:51PM -0400, Josef Bacik wrote: > > On Thu,
 Aug 22, 2024 at 09:37:00AM +0800, Li Zetao wrote: > > > Hi all, [...] 
 Content analysis details:   (-0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.180 listed in wl.mailspike.net]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.128.180 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.128.180 listed in sa-trusted.bondedsender.org]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1sibNX-0005L8-Aa
Subject: Re: [f2fs-dev] [PATCH -next 00/14] btrfs: Cleaned up folio->page
 conversion
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
Cc: willy@infradead.org, linux-f2fs-devel@lists.sourceforge.net, clm@fb.com,
 terrelln@fb.com, dsterba@suse.com, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Aug 23, 2024 at 05:15:22PM -0400, Josef Bacik wrote:
> On Fri, Aug 23, 2024 at 03:50:51PM -0400, Josef Bacik wrote:
> > On Thu, Aug 22, 2024 at 09:37:00AM +0800, Li Zetao wrote:
> > > Hi all,
> > > 
> > > In btrfs, because there are some interfaces that do not use folio,
> > > there is page-folio-page mutual conversion. This patch set should
> > > clean up folio-page conversion as much as possible and use folio
> > > directly to reduce invalid conversions.
> > > 
> > > This patch set starts with the rectification of function parameters,
> > > using folio as parameters directly. And some of those functions have
> > > already been converted to folio internally, so this part has little
> > > impact. 
> > > 
> > > I have tested with fsstress more than 10 hours, and no problems were
> > > found. For the convenience of reviewing, I try my best to only modify
> > > a single interface in each patch.
> > > 
> > > Josef also worked on converting pages to folios, and this patch set was
> > > inspired by him:
> > > https://lore.kernel.org/all/cover.1722022376.git.josef@toxicpanda.com/
> > > 
> > 
> > This looks good, I'm running it through the CI.  If that comes out clean then
> > I'll put my reviewed-by on it and push it to our for-next branch.  The CI run
> > can be seen here
> > 
> > https://github.com/btrfs/linux/actions/runs/10531503734
> > 
> 
> Looks like the compression stuff panic'ed, the run has to finish before it
> collects the dmesg so IDK where it failed yet, but I'd go over the compression
> stuff again to see if you can spot it.  When the whole run finishes there will
> be test artifacts you can get to.  If you don't have permissions (I honestly
> don't know how the artifacts permission stuff works) then no worries, I'll grab
> it in the morning and send you the test and dmesg of what fell over.  Thanks,
> 

They all fell over, so I suggest running fstests against your series before you
resend.  btrfs/069 paniced on one machine, btrfs/060 paniced on one machine.
None of the machines passsed without panicing.  Thanks,

Josef


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
