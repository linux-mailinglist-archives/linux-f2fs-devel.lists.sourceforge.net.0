Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DE3C83EB97
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 27 Jan 2024 08:09:05 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rTcoG-0005hM-GY;
	Sat, 27 Jan 2024 07:09:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1rTcoF-0005hG-Ji
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 27 Jan 2024 07:08:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=REn0s2sZgWUaEq1QCMXlfl9wfUoRWIV9bolMRyDLGnE=; b=IKbqV7hRqX721updKUKY/WLiiC
 Q6o1Bq+SESytih7AL97b9ovi3eg9vVstiu1/Kk6o6+YOA0eFGWTAvEp2LlBQP+iqUkDknD1YK5exk
 FCB+JL7BHrHGwFGzXseAbZtdMwtV42VB6snTID9PfafPBGErpj5qw847mbWRBsKrh9/s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=REn0s2sZgWUaEq1QCMXlfl9wfUoRWIV9bolMRyDLGnE=; b=D9xmbIs0yvRDxW1FCGXY60HPc8
 tG9wOChjlczFBIO59GLUsMAi1iaCU9SPz7dLhqf0iE808okVCzSzz1WzrqutjMpxHGxdbya7MfnWG
 ay3PuE1tlNmiOnHGrrvmpfD0PK5jK7FrWi1W88lcflbj8ITPBrk/bVTl0Rl/QTBNSE7U=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rTcoE-0000yC-4o for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 27 Jan 2024 07:08:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id AE3ABCE2146;
 Sat, 27 Jan 2024 07:08:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73B2AC433C7;
 Sat, 27 Jan 2024 07:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1706339325;
 bh=7w5fa3Ag9H7/c8fy6jHzWzQkyjGpS52jN7UOyJSIxRs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sf1vNO5uSOggOozanoCjLkMiKUovChZbxbH0iC0oeTc+3QqAjutuLasBVOJ0YGeh9
 vb5siXyYrhtUTnDUB4eXp5n4TdA9QONkQdGJq+/qj+uaI1M5tgpnOOlCr1Zr81Dxww
 25zRp8sUPgXF35JFynTfLm8TRnz+yAIHvM8n/tdO/YfLapqkwp9YTgBAOAYaIdFP0U
 tFzacM7clceCwWN/WGX6i1Kd4qmIcDbEo5gtDQoqbLdnMX2sch83BO4/cgUinwdiAC
 3ZyW3TS75P6dySuTuchoKTLj+s6i3CSwVGCGyIlu51mQNXhjuytmCAcxs35HQbgv/8
 NoGKhpCntAtHA==
Date: Fri, 26 Jan 2024 23:08:43 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Gabriel Krisman Bertazi <krisman@suse.de>
Message-ID: <20240127070843.GD11935@sol.localdomain>
References: <20240119184742.31088-1-krisman@suse.de>
 <20240119184742.31088-2-krisman@suse.de>
 <20240125025115.GA52073@sol.localdomain>
 <87jznxs68r.fsf@mailhost.krisman.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87jznxs68r.fsf@mailhost.krisman.be>
X-Spam-Score: -3.8 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Jan 25, 2024 at 01:55:00PM -0300, Gabriel Krisman
 Bertazi wrote: > I'm not sure how to change and still make it readable by
 users. How about: > > return invalfc(fc, "case-insensitive capable f [...]
 Content analysis details:   (-3.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -1.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rTcoE-0000yC-4o
Subject: Re: [f2fs-dev] [PATCH v3 01/10] ovl: Reject mounting
 case-insensitive filesystems
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
Cc: tytso@mit.edu, amir73il@gmail.com, linux-f2fs-devel@lists.sourceforge.net,
 viro@zeniv.linux.org.uk, linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Jan 25, 2024 at 01:55:00PM -0300, Gabriel Krisman Bertazi wrote:
> I'm not sure how to change and still make it readable by users.  How about:
> 
>   return invalfc(fc, "case-insensitive capable filesystem on %s not supported", name);
> 
> what do you think?

"case-insensitive capable" sounds good.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
