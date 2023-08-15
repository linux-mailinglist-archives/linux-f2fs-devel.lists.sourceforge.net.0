Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4344A77C68F
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 15 Aug 2023 05:59:49 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qVlDX-0002Dk-JL;
	Tue, 15 Aug 2023 03:59:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <tytso@mit.edu>) id 1qVlDW-0002De-Jx
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 15 Aug 2023 03:59:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hQVHu1e68/W/Zp/E5V+JbF6iz8mNZvWi1CMyPSC8un8=; b=FPXYQJcdHxo0gLJh7TGavyumQK
 FZMit65qgXkODrGsb7zzkwRn2Aoz6diDFaKvoS4LNpkPRTYzxtgynfdW6UWwODL40PYaCgWdxC1ut
 gDiFmib8VvDTmYDa50Mt8BtaCkSy9TVZ0JHykKlY81PaJVMrHYUGoazJAT2B2HO7CxvI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=hQVHu1e68/W/Zp/E5V+JbF6iz8mNZvWi1CMyPSC8un8=; b=h0crmcTs3IBP5A+5N8SiUy78KD
 MbXaeFfDSnRBLyPdiqA3N0mCZsRODHlth6iXt4MC4wgrzwnWqp4x9CKboEBQGjxgTxGui3rN3qZVZ
 nNWG4t9XgL5QSDYT3mXfPXvErE1E8qIArFYfQLXDGJDo3i7b+ZCFz/ltukLGSslurSnE=;
Received: from outgoing-auth-1.mit.edu ([18.9.28.11] helo=outgoing.mit.edu)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qVlDU-0060fI-ES for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 15 Aug 2023 03:59:38 +0000
Received: from cwcc.thunk.org (pool-173-48-82-92.bstnma.fios.verizon.net
 [173.48.82.92]) (authenticated bits=0)
 (User authenticated as tytso@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 37F3xD8x030093
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Aug 2023 23:59:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
 t=1692071955; bh=hQVHu1e68/W/Zp/E5V+JbF6iz8mNZvWi1CMyPSC8un8=;
 h=Date:From:Subject:Message-ID:MIME-Version:Content-Type;
 b=JGdFKfBtj/0FPkQ8fcQZkAoAmznTuYUafjbPPhPDtOwSaZhM/HVt7g3lKwWp6k299
 n53lV0FP35STcKQeOvowRopQwwcvFXuw9xFJgEvWKM8KkiB8ITg/r1RQmBiykwI1at
 rPswgebxZC6iUzx3za8Ug/1kfEHs437bisVD2p8Sn0qXs/83TVt7h4vaNvrNmrjqf5
 rRfudXDaBeZi9jyt+7G1YzHZge/dhnmMX/1pR/MEBXqdv9/gZ+1NRVVAMTGUxG6+Nx
 mD25jQmABx8YqJxtozabdjRRuRPpX7y06IJ6h4BGaIETIow1K6ZzsPGGY84yvtcZi+
 Makzq02cG2kPg==
Received: by cwcc.thunk.org (Postfix, from userid 15806)
 id 221D515C0292; Mon, 14 Aug 2023 23:59:13 -0400 (EDT)
Date: Mon, 14 Aug 2023 23:59:13 -0400
From: "Theodore Ts'o" <tytso@mit.edu>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20230815035913.GF2247938@mit.edu>
References: <20230812004146.30980-1-krisman@suse.de>
 <20230812004146.30980-2-krisman@suse.de>
 <20230812015915.GA971@sol.localdomain>
 <20230812230647.GB2247938@mit.edu>
 <ZNhJSlaLEExcoIiT@casper.infradead.org>
 <20230813043022.GA3545@sol.localdomain>
 <20230814113852.GD2247938@mit.edu>
 <20230814172244.GA1171@sol.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230814172244.GA1171@sol.localdomain>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Aug 14, 2023 at 10:22:44AM -0700, Eric Biggers wrote:
 > > Keep in mind, the syzkaller team isn't asking for these pointless "fixes"
 > either. They'd very much prefer 1 fix to 1000 fixes. I thi [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [18.9.28.11 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1qVlDU-0060fI-ES
Subject: Re: [f2fs-dev] [PATCH v5 01/10] fs: Expose helper to check if a
 directory needs casefolding
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
Cc: Gabriel Krisman Bertazi <krisman@suse.de>, brauner@kernel.org,
 Matthew Wilcox <willy@infradead.org>, linux-f2fs-devel@lists.sourceforge.net,
 viro@zeniv.linux.org.uk, linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Aug 14, 2023 at 10:22:44AM -0700, Eric Biggers wrote:
> 
> Keep in mind, the syzkaller team isn't asking for these pointless "fixes"
> either.  They'd very much prefer 1 fix to 1000 fixes.  I think some confusion
> might be arising from the very different types of problems that syzkaller finds.
> Sometimes 1 syzkaller report == 1 bug == 1 high-priority "must fix" bug == 1
> vulnerability == 1 fix needed.  But in general syzkaller is just letting kernel
> developers know about a problem, and it is up to them to decide what to do about
> it.  In this case there is one underlying issue that needs to be fixed, and the
> individual syzkaller reports that result from that issue are not important.

... except that the Syzkaller folks have created slide decks talking
about "Linux kernel security disaster", blaming the entire community,
where they quote the number unresolved syzkaller reports, without the
kind of nuance that you are referring to.

There is also not a great way of categorizing syzkaller reports as
"requires maliciously fuzzed file system image", or "writing to
mounted file system" --- either manually, or (ideally) automatically,
since the syzbot test generators knows what they are doing.

And finally, the reality is even if someone where to fix the "one
underlying issue", the reality is that it will be ten years or so
before said fixed can be rolled out, since it requires changes in
userspace utilities, as well as rolled out kernels, and enterprise
distros are around for a decade; even community distros need to be
supported for at least 3-5 years.

Finally, it's not just "one underlying issue"; there are also
"maliciously fuzzed file systems", and working around those syzbot
reports can be quite painful, especially the ones that lead to lockdep
deadlock reports.  Many of these are spurious, caused by an inode
being used in two contexts, that can only happen in a badly corrupted
file system, and for which we've already signalled that the file
system is corrupted, so if you panic on error, it wouldn't deadlock.
(And if you deadlock, it's not _that_ much worse than panicing on a
maliciously fuzzed file system.)  And all of these bugs get counted,
one for each lockdep report variation (so there can be 3-4 per root
cause) as a "security bug" in the "Linux kernel security disaster"
statistics.

I might not mind the hyperbole if said slide decks asked for more
headcount.  But instead, they blame the "Linux upstream community" for
not fixing bugs, or treating the bugs seriously.   Sigh....

  	    	    	       	      	       - Ted


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
