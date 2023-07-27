Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1623A765C40
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 27 Jul 2023 21:41:34 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qP6rT-0003t3-8j;
	Thu, 27 Jul 2023 19:41:24 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <tytso@mit.edu>) id 1qP6rR-0003sw-A8
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 27 Jul 2023 19:41:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tz9uDfs6x3woAC8m0CkGKUI4YE1GEN19wLcnCAZOmDw=; b=YSmCoaEniDMk6TeCIjQsqMTlw9
 jUUWIZHj/nlBLTRvzwek9m0qnzYMfSttmSko7I7r69J0LdlgkZCNrGQ55YCGTOzPSePY2kGWFHBQH
 w6Ha02/wjweKi+czLuKls8+ibN/28kcYqMNcunivP2AImcY2kFpkuu0EDMac7MZ7zCjo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=tz9uDfs6x3woAC8m0CkGKUI4YE1GEN19wLcnCAZOmDw=; b=JUwGqm9Mq+DgIde7PrlQBAFoRm
 1ChGGrj+x14A+EbtUbLdTw9SMdazyg8o5PCRxt7vh4ToECAn9Q01CFwMW2mhhzdMkgkSqSp/iSXWf
 upSMtb33675UJcHtb2bGflVI75XCyuA+P0MICgvpX1/PuJe54Rk75RtlPw5kFiueJfX8=;
Received: from outgoing-auth-1.mit.edu ([18.9.28.11] helo=outgoing.mit.edu)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qP6rR-004uN0-6S for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 27 Jul 2023 19:41:22 +0000
Received: from cwcc.thunk.org (pool-173-48-115-64.bstnma.fios.verizon.net
 [173.48.115.64]) (authenticated bits=0)
 (User authenticated as tytso@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 36RJf3O0011710
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Jul 2023 15:41:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
 t=1690486865; bh=tz9uDfs6x3woAC8m0CkGKUI4YE1GEN19wLcnCAZOmDw=;
 h=Date:From:Subject:Message-ID:MIME-Version:Content-Type;
 b=It93TSp9L8wmstJLNCNTuAY5F9XA33MfVDdDuin7qGEU7Z1pdbkb7Wi8DTEerb91b
 5RUCBvW6KEGb1NP56fho0ANmvHGN/2GLSHW7LdnapAg1oA8TTlGolMOswnkL6AQFUd
 vRBVD7JvntP5y/H1d0dh+uF5UW+E7Khk3ghokHmnOkADEU6ecU3YAu/uWO0tCMMcKs
 BVBZRsaJIri2VAjngUhGkhDqxZD8V9tnlLVu3LL/ZFd/MI+wiedOYssjhcnhbFWISf
 9npS4Oy8x1mcuf8CLcc779ImSxiGWu4oMHFSO/2FPHFDk1BftxWejYODL+x2fWnQSu
 4Y1X77ku0GlVg==
Received: by cwcc.thunk.org (Postfix, from userid 15806)
 id 5951E15C04EF; Thu, 27 Jul 2023 15:41:03 -0400 (EDT)
Date: Thu, 27 Jul 2023 15:41:03 -0400
From: "Theodore Ts'o" <tytso@mit.edu>
To: Gabriel Krisman Bertazi <krisman@suse.de>
Message-ID: <20230727194103.GJ30264@mit.edu>
References: <20230727172843.20542-1-krisman@suse.de>
 <20230727181339.GH30264@mit.edu> <87cz0d2o78.fsf@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87cz0d2o78.fsf@suse.de>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Jul 27, 2023 at 02:39:55PM -0400, Gabriel Krisman
 Bertazi wrote: > > Also, Christian, I notice one of the five VFS patches in
 the series > > has your Reviewed-by tag, but not the others? Is th [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [18.9.28.11 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1qP6rR-004uN0-6S
Subject: Re: [f2fs-dev] [PATCH v4 0/7] Support negative dentries on
 case-insensitive ext4 and f2fs
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
Cc: brauner@kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 ebiggers@kernel.org, viro@zeniv.linux.org.uk, linux-fsdevel@vger.kernel.org,
 jaegeuk@kernel.org, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Jul 27, 2023 at 02:39:55PM -0400, Gabriel Krisman Bertazi wrote:
> > Also, Christian, I notice one of the five VFS patches in the series
> > has your Reviewed-by tag, but not the others?  Is that because you
> > haven't had a chance to make a final determination on those patches,
> > or you have outstanding comments still to be addressed?
> 
> I'm not sure if I missed Christian's tag in a previous iteration. I
> looked through my archive and didn't find it. Unless I'm mistaken, I
> don't think I have any r-b from him here yet.

Ah, right.  I looked back and I'm not sure why I thought he had signed
off one of them; I must have hallucinated it....

							- Ted


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
