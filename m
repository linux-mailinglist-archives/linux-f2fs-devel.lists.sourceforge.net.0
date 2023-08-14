Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B84A077C195
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 14 Aug 2023 22:37:55 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qVeJv-00062Y-TE;
	Mon, 14 Aug 2023 20:37:47 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1qVeJu-00062S-6Y
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 14 Aug 2023 20:37:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3KaM95H8lxdcFwHlB8zFOUmfx9269nBnNCgvq34uksU=; b=BdJPSCN5CoUoRAHd3HVHCarvFf
 MlzORGlKm/uUhZojg5CndPzMvjoFteRBLmCrwTpOBcP4YshuAh//WAT4Sqeod1hY13A6VEmBYu+HL
 SBcA4FjmO/w4m/d2ChNmeh4Bv7P6tjyrB9jX3VhGR8LonifZDQVoF5wMhUUFOXN5p/7c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3KaM95H8lxdcFwHlB8zFOUmfx9269nBnNCgvq34uksU=; b=euDurPuYgkYxVoX/a8vk6UaAJf
 BWyMebGLS2mJzuk2WkIV3StNFg+8JxIVR4J60CeiXtbWniWJ3KDWYuOr+MwAKe9VVR6i/abm0QMnX
 l06PiBNMI907+KgQrkmcXC1XybJ8fQcmMvmQAyFQdN4EQGrNum5P/qwFRE/8Brp6NYqw=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qVeJs-0007EZ-N7 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 14 Aug 2023 20:37:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1D94261B8C;
 Mon, 14 Aug 2023 20:37:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32D9AC433C8;
 Mon, 14 Aug 2023 20:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692045458;
 bh=p/3cegYidBuPQOysI3EfoMODZv58DITeMGmAbN5Lraw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=M9Gj4ubRIm3PLxL0kOHAMCQbhl5UCr73qpln3KKMYGI8BLRT42nJyC5CTPpHF4ndY
 YBIPHCeJjmV2NH0Q3B/m/UnVyIoottcNuILf10IYEJG4+zUfkHphzakSnVN8VdfUlM
 iSXTFMuoXVShf2rz3Vq8J2jZczWE3g/r4n9A5klaL+G5rDuLAEdJ5NffG20axDDyMD
 PUG67WZiX27Od1lPassZvtcavO5pQK9uxsL6hDMkQP/NyY8A6s6Wc71FT4hKfs2w34
 NjUqxAtygX/kWlTIAL5iqO4tdReb4cBWgwprtGdqwkylzH6CZZR3DhkE1kmALM2djG
 TaDUDVV2xUmHg==
Date: Mon, 14 Aug 2023 13:37:36 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Kajetan Puchalski <kajetan.puchalski@arm.com>
Message-ID: <ZNqQkDm0YschY+WI@google.com>
References: <20230306122549.236561-1-douglas.raillard@arm.com>
 <ZNotAI1T+hKfzJWV@e126311.manchester.arm.com>
 <ZNo8hoR2V3Zo14+l@e126311.manchester.arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZNo8hoR2V3Zo14+l@e126311.manchester.arm.com>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 08/14, Kajetan Puchalski wrote: > On Mon, Aug 14, 2023
 at 02:32:53PM +0100, Kajetan Puchalski wrote: > > On Mon, Mar 06, 2023 at
 12:25:49PM +0000, Douglas RAILLARD wrote: > > > From: Douglas Railla [...]
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 WEIRD_PORT             URI: Uses non-standard port number for HTTP
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qVeJs-0007EZ-N7
Subject: Re: [f2fs-dev] [PATCH] f2fs: Fix f2fs_truncate_partial_nodes ftrace
 event
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
Cc: "open list:TRACING" <linux-kernel@vger.kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>,
 "open list:F2FS FILE SYSTEM" <linux-f2fs-devel@lists.sourceforge.net>,
 jstultz@google.com, Masami Hiramatsu <mhiramat@kernel.org>, qyousef@google.com,
 Douglas RAILLARD <douglas.raillard@arm.com>, lukasz.luba@arm.com,
 "open list:TRACING" <linux-trace-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 08/14, Kajetan Puchalski wrote:
> On Mon, Aug 14, 2023 at 02:32:53PM +0100, Kajetan Puchalski wrote:
> > On Mon, Mar 06, 2023 at 12:25:49PM +0000, Douglas RAILLARD wrote:
> > > From: Douglas Raillard <douglas.raillard@arm.com>
> > > 
> > > Fix the nid_t field so that its size is correctly reported in the text
> > > format embedded in trace.dat files. As it stands, it is reported as
> > > being of size 4:
> > > 
> > >         field:nid_t nid[3];     offset:24;      size:4; signed:0;
> > > 
> > > Instead of 12:
> > > 
> > >         field:nid_t nid[3];     offset:24;      size:12;        signed:0;
> > > 
> > > This also fixes the reported offset of subsequent fields so that they
> > > match with the actual struct layout.
> > > 
> > > 
> > > Signed-off-by: Douglas Raillard <douglas.raillard@arm.com>
> > > ---
> > >  include/trace/events/f2fs.h | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/include/trace/events/f2fs.h b/include/trace/events/f2fs.h
> > > index 31d994e6b4ca..8d053838d6cf 100644
> > > --- a/include/trace/events/f2fs.h
> > > +++ b/include/trace/events/f2fs.h
> > > @@ -512,7 +512,7 @@ TRACE_EVENT(f2fs_truncate_partial_nodes,
> > >  	TP_STRUCT__entry(
> > >  		__field(dev_t,	dev)
> > >  		__field(ino_t,	ino)
> > > -		__field(nid_t,	nid[3])
> > > +		__array(nid_t,	nid, 3)
> > >  		__field(int,	depth)
> > >  		__field(int,	err)
> > >  	),
> > > -- 
> > > 2.25.1
> > 
> > Hi,
> > 
> > Just wanted to flag that I noticed this breaks Perfetto tracing on
> > Android, at least as of Android 13. I'm not sure if it's been fixed in newer
> > versions. Looks like the version of Perfetto in Android 13 is expecting
> > the previous (ie broken) field format to be there and its entire ftrace
> > collector fails as a result:
> > 
> > E/perfetto( 3532): ranslation_table.cc:133 Failed to infer ftrace field type for "f2fs_truncate_partial_nodes.nid" (type:"nid_t nid[3]" size:12 signed:0) (errno: 2, No such file or directory)
> > I/perfetto( 3640):            probes.cc:65 Hard resetting ftrace state.
> > 
> > For my own purposes I just reverted these two:
> > * 0b04d4c0542e8573a837b1d81b94209e48723b25 (f2fs: Fix f2fs_truncate_partial_nodes ftrace event)
> > * f82e7ca019dfad3b006fd3b772f7ac569672db55 (tracing: Error if a trace event has an array for a __field()
> > 
> > and now it works fine so not the biggest deal but this should probably
> > be addressed, I imagine more likely on the Perfetto side.
> 
> Added context here, it is just caused by the parser implementation in Perfetto
> being pretty lacking:
> 
> https://github.com/google/perfetto/blob/c36c70c1d4a72eafdd257f7a63e55f49fbc3df3d/src/traced/probes/ftrace/proto_translation_table.cc#L255

Hi, I believe this was fixed by
https://android-review.git.corp.google.com/c/platform/external/perfetto/+/2587146


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
