Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ED588C8B19
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 17 May 2024 19:36:54 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1s81Ve-0006RO-HH;
	Fri, 17 May 2024 17:36:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <groeck7@gmail.com>) id 1s81Vc-0006RE-Vp;
 Fri, 17 May 2024 17:36:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rzMfxbAB8QJEcJdIySGROcUOqAKXWq8nqUdcExbi1Zk=; b=MJ/384a4meqm44ZGZOfEifY57f
 m3Wd8G2VOrviwFhdx5PikVbaOC8yLy4D6drSMSyQzKcmIoKJ2ASO2sr+llivWloZRKh5hMG4+B2wl
 FQfaOatQB33twkmAkx4AaY2obOrgUajWQoIi6uwn+nKWYiQDpbykL528tJWq4nCDVTbo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=rzMfxbAB8QJEcJdIySGROcUOqAKXWq8nqUdcExbi1Zk=; b=CVrgwOb0Ojq4v4amBdHo7wO/iW
 up7zX6cne8DhpwH96DCDXMN4j83N4qkjXOe2bqwwsZjq601ducFLNuMcmmISa0bN6eRjW9IZcV1P/
 yTkmMu9EadWpoYnZnaRNmIo6PiSYtlH2uBJogjwsjoqfSIUYPEKUtxn2dq8AJS1f7SK4=;
Received: from mail-pl1-f179.google.com ([209.85.214.179])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1s81Vd-0001J4-B1; Fri, 17 May 2024 17:36:45 +0000
Received: by mail-pl1-f179.google.com with SMTP id
 d9443c01a7336-1edf506b216so15702375ad.2; 
 Fri, 17 May 2024 10:36:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715967399; x=1716572199; darn=lists.sourceforge.net;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
 :reply-to; bh=rzMfxbAB8QJEcJdIySGROcUOqAKXWq8nqUdcExbi1Zk=;
 b=WKuU/ozAEUAOVz/gzf6/h6NSCvDAaowgm3iVp99fITSVZIUnAaxCaz8nnZ4wXLO6eG
 1yV4viv44DYtmx8I6rzoFwAwvmHFT/y0+dKla9j/NY5dMlSDBqjAV+ggNz1/laos3EZC
 ck2kfWWT4RT1IeEFyXSbFgKhZOM2cC0ZALn3PB761aq4WRoXNYC0gPBcPzWsKXl7KP5K
 LKvfY+/XvzxuE3+6jynqCHE0jkgi9VySiXKwRxhWnTF65vZMJNTBqYi8s5NUwmYNMbOA
 myu0iuH1BaRsNG/gFMg89cjOUGya0twRyVHRix9Q/5eklvoqjKF/BK6EDo2w/hEHeQe2
 xVCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715967399; x=1716572199;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rzMfxbAB8QJEcJdIySGROcUOqAKXWq8nqUdcExbi1Zk=;
 b=tE8Xt+eID/xIUzZcMCCutVPG5MKn2qRVdaNSAZs/qEFzOoQPqQnfniHf6dmkiltB8g
 M9osyuWRn/anUi/orrEcM3pO3cfom0Q8oVCFTtdZ0lfVhdt0i4K0sDMmRqo/ZaDa+Uy8
 2+HUiTfYSWQiFbRaPAe0EOhxqrdNfhr0D0yJ+Fk5jJvpfFCP2bONfQERcWTJktU9VBVm
 hLUDuvIiqQb4rDv06a5AOwBXs73otzuuFswCUZ8f2y7c7d3ypitWxlL1SfxeQ0wmb3JF
 MgrnODibQB1Iy0q9FVw2erYpb/cHSeEQpc6An0yJIfnGXENZNTVTMv1p1oyEel8dFEnJ
 RlpQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXtbVXUCvyqX/jM5RByzq2yYVmFzJjnJnxPqBHVGkgS6kk/GKB8IUAdCBK5SLayyLNMAj4kQ0aMxV0Dymh4mWqDE6zVHca40bo/oGwusA9kQguimv98AOt4aCjl5FOBfQQv2sTw9XohCnoCp5M1n1I1F9f5MKPJuDOEOh4vHw==
X-Gm-Message-State: AOJu0YypbFYBQZ8oM+DD94ialYpFUt8zg+veW2q0G9aZu1jTuY3c8XIn
 Eps3dVvARFmHN2PyRvGBJnhNR1Dv7+WUl6zZ9i0XoafWqbowA8P/
X-Google-Smtp-Source: AGHT+IHJ9PZtASiLb9HJkYrHy1DRhdQlVEuKbRr0NYIRv4Tx+av91BIA0wx1gBcIQQlm9sd2COIQnQ==
X-Received: by 2002:a17:90a:9606:b0:2b9:a299:928e with SMTP id
 98e67ed59e1d1-2b9a29994c9mr10436893a91.24.1715967398710; 
 Fri, 17 May 2024 10:36:38 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2b67105666csm15749258a91.8.2024.05.17.10.36.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 May 2024 10:36:38 -0700 (PDT)
Date: Fri, 17 May 2024 10:36:37 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Steven Rostedt <rostedt@goodmis.org>
Message-ID: <5080f4c5-e0b3-4c2e-9732-f673d7e6ca66@roeck-us.net>
References: <20240516133454.681ba6a0@rorschach.local.home>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240516133454.681ba6a0@rorschach.local.home>
X-Spam-Score: 0.4 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, May 16, 2024 at 01:34:54PM -0400,
 Steven Rostedt wrote:
 > From: "Steven Rostedt (Google)" <rostedt@goodmis.org> > > [ > This is a
 treewide change. I will likely re-create this patch again in > [...] 
 Content analysis details:   (0.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.179 listed in wl.mailspike.net]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [groeck7[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [groeck7[at]gmail.com]
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 0.0 FREEMAIL_FORGED_FROMDOMAIN 2nd level domains in From and
 EnvelopeFrom freemail headers are different
X-Headers-End: 1s81Vd-0001J4-B1
Subject: Re: [f2fs-dev] [PATCH] tracing/treewide: Remove second parameter of
 __assign_str()
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
Cc: linux-hyperv@vger.kernel.org, linux-usb@vger.kernel.org,
 kvm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 brcm80211@lists.linux.dev, ath10k@lists.infradead.org,
 Julia Lawall <Julia.Lawall@inria.fr>, linux-s390@vger.kernel.org,
 dev@openvswitch.org, linux-cifs@vger.kernel.org, linux-rdma@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, io-uring@vger.kernel.org,
 linux-bcachefs@vger.kernel.org, iommu@lists.linux.dev,
 ath11k@lists.infradead.org, linux-media@vger.kernel.org,
 linux-wpan@vger.kernel.org, linux-pm@vger.kernel.org, selinux@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-erofs@lists.ozlabs.org, virtualization@lists.linux.dev,
 linux-sound@vger.kernel.org, linux-block@vger.kernel.org,
 ocfs2-devel@lists.linux.dev,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, linux-cxl@vger.kernel.org,
 linux-tegra@vger.kernel.org, intel-xe@lists.freedesktop.org,
 linux-edac@vger.kernel.org, linux-hwmon@vger.kernel.org,
 brcm80211-dev-list.pdl@broadcom.com,
 Linus Torvalds <torvalds@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 linux-wireless@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 ath12k@lists.infradead.org, tipc-discussion@lists.sourceforge.net,
 Masami Hiramatsu <mhiramat@kernel.org>, netdev@vger.kernel.org,
 bpf@vger.kernel.org, Linux trace kernel <linux-trace-kernel@vger.kernel.org>,
 freedreno@lists.freedesktop.org, linux-nfs@vger.kernel.org,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, May 16, 2024 at 01:34:54PM -0400, Steven Rostedt wrote:
> From: "Steven Rostedt (Google)" <rostedt@goodmis.org>
> 
> [
>    This is a treewide change. I will likely re-create this patch again in
>    the second week of the merge window of v6.10 and submit it then. Hoping
>    to keep the conflicts that it will cause to a minimum.
> ]
> 
> With the rework of how the __string() handles dynamic strings where it
> saves off the source string in field in the helper structure[1], the
> assignment of that value to the trace event field is stored in the helper
> value and does not need to be passed in again.
> 
> This means that with:
> 
>   __string(field, mystring)
> 
> Which use to be assigned with __assign_str(field, mystring), no longer
> needs the second parameter and it is unused. With this, __assign_str()
> will now only get a single parameter.
> 
> There's over 700 users of __assign_str() and because coccinelle does not
> handle the TRACE_EVENT() macro I ended up using the following sed script:
> 
>   git grep -l __assign_str | while read a ; do
>       sed -e 's/\(__assign_str([^,]*[^ ,]\) *,[^;]*/\1)/' $a > /tmp/test-file;
>       mv /tmp/test-file $a;
>   done
> 
> I then searched for __assign_str() that did not end with ';' as those
> were multi line assignments that the sed script above would fail to catch.
> 

Building csky:allmodconfig (and others) ... failed
--------------
Error log:
In file included from include/trace/trace_events.h:419,
                 from include/trace/define_trace.h:102,
                 from drivers/cxl/core/trace.h:737,
                 from drivers/cxl/core/trace.c:8:
drivers/cxl/core/./trace.h:383:1: error: macro "__assign_str" passed 2 arguments, but takes just 1

This is with the patch applied on top of v6.9-8410-gff2632d7d08e.
So far that seems to be the only build failure.
Introduced with commit 6aec00139d3a8 ("cxl/core: Add region info to
cxl_general_media and cxl_dram events"). Guess we'll see more of those
towards the end of the commit window.

Guenter


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
