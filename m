Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D67DA21657
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 29 Jan 2025 02:45:46 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tcx9A-0004hm-Hc;
	Wed, 29 Jan 2025 01:45:40 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <mchehab+huawei@kernel.org>) id 1tcx98-0004hZ-OV
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 29 Jan 2025 01:45:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yd4ItzRGNHbICJzatUJZS8IxfCEz4mUGAMBgyagfjUE=; b=WnhImiuPO2motfXW/oh4AuxJAC
 UIWrDGqcO6xhCLAdNQ0jLzaN8AZr9Pim6qv6Skwhod/7H5TgW3PCQgJgF7ihyiok4gkL4PDa0IfYb
 bCiIqVXACUraFH2Ty26RDy5VIPlvQc8Zz0EpNLQCzwUT7qxokseoZ+RfZsAQyhk1+6IY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=yd4ItzRGNHbICJzatUJZS8IxfCEz4mUGAMBgyagfjUE=; b=LjlsmQdpCFRX4i10krkbpusc/I
 NMLGKyWd3rDLbeF/2p4GQUL51Auc65ntWFJfd7+rnGAuLYhVfUuGN7P8O/ELtTTDS+RIR0ZAox9V7
 goeJHU3b4wKmmTdONkapxcq5VuXLTtkiigQwWKYtrvuYqjiHcALxgKM6j58k79BeT7GA=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tcx97-00053m-OV for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 29 Jan 2025 01:45:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 1A42DA41306;
 Wed, 29 Jan 2025 01:43:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3927EC4CED3;
 Wed, 29 Jan 2025 01:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1738115124;
 bh=CWzXW0bIMSURgr0c3IY4/tvstyV6bj1ozJj9dzgjU1s=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=tJt4ZVW0p8weQsSPDZjLgTUab4flB9ZDeO3oV5MFy7mrenPn2R71XljjJYKAkhnrm
 UCkaqQqT+OZAhF0CZcDf6w+z1Qt+gQsQ5OCNAxgM1rmArls+WMymb4Mq830RmFCoKO
 +qFwvjNxZ5/w+Tx4QkGkdy0DNTUbSSpw6PslUzb5XdvZf0l8UzSKbhwOCZjyb+SnY9
 q6L5Zj8WJL2S1/bLsi4d6YQV8UUltZT+eHdIQb3MT8SpdgDLFwbf9U5bSybrLtzkIN
 sufR1bq3uvCWQSqMly5wDlwj2bsOCg3IPtP8q6yZFB3HIxEpMDKVAt03sxW/8L9VE6
 rHgpPPhwR2yMg==
Date: Wed, 29 Jan 2025 02:45:18 +0100
To: Jonathan Corbet <corbet@lwn.net>
Message-ID: <20250129024518.69c0be81@foz.lan>
In-Reply-To: <87h65i7e87.fsf@trenco.lwn.net>
References: <cover.1738020236.git.mchehab+huawei@kernel.org>
 <87h65i7e87.fsf@trenco.lwn.net>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Spam-Score: -3.8 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Em Tue,
 28 Jan 2025 15:42:00 -0700 Jonathan Corbet <corbet@lwn.net>
 escreveu: > Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes: > >
 > Hi Jon/Greg, > > > > That's the second version of my RFC patches meant
 to modenize the ABI > > parser that I wrote in Perl. > > I have [...] 
 Content analysis details:   (-3.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [147.75.193.91 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in sa-trusted.bondedsender.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in bl.score.senderscore.com]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -1.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tcx97-00053m-OV
Subject: Re: [f2fs-dev] [RFC v2 00/38] Improve ABI documentation generation
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
From: Mauro Carvalho Chehab via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: linux-usb@vger.kernel.org,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>, linux-iio@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, coresight@lists.linaro.org,
 linux-pm@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-block@vger.kernel.org, linux-hardening@vger.kernel.org,
 workflows@vger.kernel.org, netdev@vger.kernel.org, bpf@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Em Tue, 28 Jan 2025 15:42:00 -0700
Jonathan Corbet <corbet@lwn.net> escreveu:

> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:
> 
> > Hi Jon/Greg,
> >
> > That's the second version of my RFC patches meant to modenize the ABI
> > parser that I wrote in Perl.  
> 
> I have a couple of minor comments on the individual patches, but overall
> I do like this direction.
> 
> It would be nice, though, if the code were a bit more extensively
> commented.  Parts of it get into the "twistly maze of regexes" mode that
> can be awfully hard to follow.

The regex code is indeed complex, but documenting it is not an easy task.
Btw, they are (about) the same that the Perl script does. imported also
the documentation for there. I did some extra cleanups/optimizations there,
though, after checking the results of some expressions.

The big issue is that we don't have an uniform way of defining What: 
expressions. So, each subsystem (and/or author) document it in different
ways.

There are even some ABI symbols with:

	$(readlink)/sys/...

(I intend to send a patch for those later on)

and:

	What: /sys/something/...

	What: .../something_else

(I guess ".../" means "/sys/something/...", but I can't be sure, as this
is on one driver for a hardware I don't have - so, if I send a patch,
I may end breaking it)

If you want to understand how the whole set of regexes work, you can
run:

	$ ./scripts/get_abi.py -d 16 undefined --dry-run >/dev/null
...
	[DEBUG] /sys/kernel/mm/damon/admin/kdamonds/\w+/contexts/\w+/schemes/\w+/quotas/goals/\w+/current_value <== /sys/kernel/mm/damon/admin/kdamonds/<K>/contexts/<C>/schemes/<S>/quotas/goals/<G>/current_value
	[DEBUG] /sys/kernel/mm/damon/admin/kdamonds/\w+/contexts/\w+/schemes/\w+/quotas/goals/\w+/target_metric <== /sys/kernel/mm/damon/admin/kdamonds/<K>/contexts/<C>/schemes/<S>/quotas/goals/<G>/target_metric
	[DEBUG] /sys/kernel/mm/damon/admin/kdamonds/\w+/contexts/\w+/schemes/\w+/quotas/goals/\w+/target_value <== /sys/kernel/mm/damon/admin/kdamonds/<K>/contexts/<C>/schemes/<S>/quotas/goals/<G>/target_value
	[DEBUG] /sys/kernel/mm/damon/admin/kdamonds/\w+/contexts/\w+/schemes/\w+/quotas/goals/nr_goals     <== /sys/kernel/mm/damon/admin/kdamonds/<K>/contexts/<C>/schemes/<S>/quotas/goals/nr_goals
	[DEBUG] /sys/kernel/mm/damon/admin/kdamonds/\w+/contexts/\w+/schemes/\w+/quotas/ms                 <== /sys/kernel/mm/damon/admin/kdamonds/<K>/contexts/<C>/schemes/<S>/quotas/ms
	[DEBUG] /sys/kernel/mm/damon/admin/kdamonds/\w+/contexts/\w+/schemes/\w+/quotas/reset_interval_ms  <== /sys/kernel/mm/
...

This will place at stderr all regular expressions that are currently
parsed (they're currently used only for /sys symbols).

Yet, instead of spending too much time documenting them, IMO we shold
do the do the reverse: use the AbiRegex class to convert "What:" into
a new tag (like "Regex:") and use it as much as possible (we'll still
need "What:" for some things that aren't devnodes), as, with regular
expressions, symbols can be clearly documented. As on python match groups
can be named with:

	(?P<name>...)

this could be used to better describe some arguments, e.g. (picking an
easy case):

	What: /sys/module/<MODULENAME>/srcversion

could be described, instead, as:

	Regex: /sys/module/(?P<MODULENAME>[\w\-]+)/srcversion

The Kernel_abi extension (actually AbiParser class) can either display it
as-is (my personal preference), or even replace:
	(?P<MODULENAME>[\w\-]+)
with:
	MODULENAME

and still output this at html/pdf output as before, e. g.:

	What: /sys/module/<MODULENAME>/srcversion

Yet, doing it on a consistent way.

This is easier said than done, as if we do some automatic conversion,
subsystem reviewers/maintainers will need to double-check if the
converted expressions make sense.


> > On this series we have:
> >
> > patches 1 to 11: several bug fixes addressing issues at ABI symbols;  
> 
> 1-3 aren't needed - it seems you already upstreamed #2?
> 
> For the rest, is there any reason to not apply them right away?  They
> just seem like worthwhile fixes.
> 
> > patch 12: a fix for scripts/documentation-file-ref-check
> > patches 13-15: create new script with rest and search logic and 
> >   minimally integrate with kernel_abi Sphinx extension(phase 1);
> > patches 16-19: implement phase 2: class integration (phase 2);
> > patch 20: fix a bug at kernel_abi: the way it splits lines is buggy;
> > patches  21-24: rewrite kernel_abi logic to make it simpler and more
> >   robust;
> > patches 25-27: add cross-reference support at automarkup;
> > patches 28-36: several ABI cleanups to cope with the improvements;
> > patch 37: implement undefined command;
> > patch 38: get rid of the old Perl script.
> >
> > To make it easier to review/apply, I may end breaking the next version
> > on a couple of different patchsets. Still it would be nice to have more
> > people testing it and providing some feedback.  
> 
> I've looked over everything, though with limited depth. 

> My testing hasn't turned up any problems.  

Great!

> I've only tested with current Sphinx,
> have you tried this with the more ancient versions we support?

Not yet, but I double-checked at Sphinx documentation to be sure that
I won't be using any newer methods: I just kept using the same Sphinx
API as used by other extensions at the Kernel.

For instance this loop:

    def do_parse(self, content, node):
        with switch_source_input(self.state, content):
            self.state.nested_parse(content, 0, node, match_titles=1)

was changed on Sphinx 7.4[1], and even nested_parse(match_titles=1) is
not the recommended code for versions < 7.4, as there is this 
replacement function:

	nested_parse_with_titles()

Yet, as they're working fine at least up to version 8.1.3, we can
keep using the old way.

In any case, I'll do a test before sending the final version to see if
it works fine with our minimal version.

[1] See: https://www.sphinx-doc.org/en/master/extdev/markupapi.html

- 

On a separate discussion, I noticed one potential compatibility issue
we may have with future Python versions, due to some ascii texts
formatted as unicode. I'll send later a patch fixing them.

Additionally, automarkup has backward-compatible code with Python 2.7.
 Can I send patches dropping 2.7 support from Sphinx extensions?

> [It's probably time to raise our minimum version again, especially now
> that current Sphinx has better performance.]

Agreed. 

IMO, we should also increase Python's minimal version.

> I don't see a whole lot of reasons not to apply this set shortly after
> the merge window; anybody disagree?

Thanks,
Mauro


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
