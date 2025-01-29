Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BE617A22197
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 29 Jan 2025 17:19:47 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tdAmz-0005tX-VP;
	Wed, 29 Jan 2025 16:19:41 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <mchehab+huawei@kernel.org>) id 1tdAmy-0005tR-FQ
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 29 Jan 2025 16:19:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wgccypM608yn+N2BvL1dQlkUG29OMNY3loixTZzNS0w=; b=JkdITFODtLlKBYjb7OvdfL42I8
 gqTGyBngmRyJaBUbjWhZaz0DLJkl5wbax60dyQCguwe2wdtXZ41erhvYQbMq9iMxEEQhlLOV3RVmI
 PuldPIqGc6eYgOn4x/OSzBdbMthCOO59ibqTIIlWzBJ6lEzsw/Fif4iX96N3bjg5qgeE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wgccypM608yn+N2BvL1dQlkUG29OMNY3loixTZzNS0w=; b=LPL6uu9FArwOMdmyw1adQembXC
 JyhqEBZC9BjAKRUnpofWqwdrQhKsX9lXMU1NlXx0IJWzb3AmW2qsXy+BL+OnygpoRsJiyz+OeoCSd
 QkSMkAkZ64JUxQLIE2HvgLoJ+HTi+D5k7crj0UbiW8cJErKp2AneTud9zqoLkixRyt8I=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tdAmx-0001FG-Ad for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 29 Jan 2025 16:19:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id D7828A41970;
 Wed, 29 Jan 2025 16:17:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDB92C4CED1;
 Wed, 29 Jan 2025 16:19:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1738167568;
 bh=VQ1tE7auwykWHFaAWlmFtxRv+H5gTV+mb3VLluuo+bU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=n/4WzsGK81F59SkkUMb+WMCMS5ZHaRbmeLw6ahJDhfCBABA4a6KVBCSwK9uQe2dCx
 x0mNRgNXoAzA3H2ahKHYKJqAKXXN8MREVyvIrV0GgJAcoI7h6gX9LHdjLTxtClMSx4
 EddIHSjyw6wAz2IS3Q+EeK4Ip3z4ZZbwoD7CtalDQ7OeIU8gJmPRFPLhFO6904UeOL
 pbOtP49em5EsHn7LjmGJCQd4vKS5POHzZdHn43fsshTYlLqDnGfVcMwX7Xp0QR2BJT
 vmSJuwnOZQMB3s3i2xEUR2Vvxazeak0N6s9PY8c7YRZAkNftTuLHW4TgGq2APSSIua
 GqdW/Bxq24vdQ==
Date: Wed, 29 Jan 2025 17:19:22 +0100
To: Jonathan Corbet <corbet@lwn.net>
Message-ID: <20250129171922.4322c338@foz.lan>
In-Reply-To: <87a5b96296.fsf@trenco.lwn.net>
References: <cover.1738020236.git.mchehab+huawei@kernel.org>
 <87h65i7e87.fsf@trenco.lwn.net> <20250129164157.3c7c072d@foz.lan>
 <87a5b96296.fsf@trenco.lwn.net>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Spam-Score: -3.8 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Em Wed,
 29 Jan 2025 08:58:13 -0700 Jonathan Corbet <corbet@lwn.net>
 escreveu: > Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes: > >
 > So, I'm proposing to change the minimal requirements to: > > - Sphinx 3.4.3; 
 > > - Python 3.9 > > > > By setting Sphinx minimal versio [...] 
 Content analysis details:   (-3.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [147.75.193.91 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in bl.score.senderscore.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -1.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tdAmx-0001FG-Ad
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

Em Wed, 29 Jan 2025 08:58:13 -0700
Jonathan Corbet <corbet@lwn.net> escreveu:

> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:
> 
> > So, I'm proposing to change the minimal requirements to:
> > 	- Sphinx 3.4.3;
> > 	- Python 3.9
> >
> > By setting Sphinx minimal version to 3.4.3, we can get rid of all
> > Sphinx backward-compatible code.  
> 
> That's certainly a nice thought.
> 
> With regard to Python ... are all reasonable distributions at 3.9 at
> least?  CentOS 9 seems to be there, and Debian beyond it.  So probably
> that is a reasonable floor to set?

I didn't check, but those are the current minimal versions above 3.5 for
what we have at the Kernel tree[1]:

            !2, 3.10     tools/net/sunrpc/xdrgen/generators/__init__.py
            !2, 3.10     tools/net/sunrpc/xdrgen/generators/program.py
            !2, 3.10     tools/net/sunrpc/xdrgen/subcmds/source.py
            !2, 3.10     tools/net/sunrpc/xdrgen/xdr_ast.py
            !2, 3.10     tools/power/cpupower/bindings/python/test_raw_pylibcpupower.py
            !2, 3.9      tools/testing/selftests/net/rds/test.py
            !2, 3.9      tools/net/ynl/ethtool.py
            !2, 3.9      tools/net/ynl/cli.py
            !2, 3.9      scripts/checktransupdate.py
            !2, 3.8      tools/testing/selftests/tc-testing/plugin-lib/nsPlugin.py
            !2, 3.8      tools/testing/selftests/hid/tests/base.py
            !2, 3.7      tools/testing/selftests/turbostat/smi_aperf_mperf.py
            !2, 3.7      tools/testing/selftests/turbostat/defcolumns.py
            !2, 3.7      tools/testing/selftests/turbostat/added_perf_counters.py
            !2, 3.7      tools/testing/selftests/hid/tests/conftest.py
            !2, 3.7      tools/testing/kunit/qemu_config.py
            !2, 3.7      tools/testing/kunit/kunit_tool_test.py
            !2, 3.7      tools/testing/kunit/kunit.py
            !2, 3.7      tools/testing/kunit/kunit_parser.py
            !2, 3.7      tools/testing/kunit/kunit_kernel.py
            !2, 3.7      tools/testing/kunit/kunit_json.py
            !2, 3.7      tools/testing/kunit/kunit_config.py
            !2, 3.7      tools/perf/scripts/python/gecko.py
            !2, 3.7      scripts/rust_is_available_test.py
            !2, 3.7      scripts/bpf_doc.py
            !2, 3.6      tools/writeback/wb_monitor.py
            !2, 3.6      tools/workqueue/wq_monitor.py
            !2, 3.6      tools/workqueue/wq_dump.py
            !2, 3.6      tools/usb/p9_fwd.py
            !2, 3.6      tools/tracing/rtla/sample/timerlat_load.py
            !2, 3.6      tools/testing/selftests/net/openvswitch/ovs-dpctl.py
            !2, 3.6      tools/testing/selftests/net/nl_netdev.py
            !2, 3.6      tools/testing/selftests/net/lib/py/ynl.py
            !2, 3.6      tools/testing/selftests/net/lib/py/utils.py
            !2, 3.6      tools/testing/selftests/net/lib/py/nsim.py
            !2, 3.6      tools/testing/selftests/net/lib/py/netns.py
            !2, 3.6      tools/testing/selftests/net/lib/py/ksft.py
            !2, 3.6      tools/testing/selftests/kselftest/ksft.py
            !2, 3.6      tools/testing/selftests/hid/tests/test_tablet.py
            !2, 3.6      tools/testing/selftests/hid/tests/test_sony.py
            !2, 3.6      tools/testing/selftests/hid/tests/test_multitouch.py
            !2, 3.6      tools/testing/selftests/hid/tests/test_mouse.py
            !2, 3.6      tools/testing/selftests/hid/tests/base_gamepad.py
            !2, 3.6      tools/testing/selftests/hid/tests/base_device.py
            !2, 3.6      tools/testing/selftests/drivers/net/stats.py
            !2, 3.6      tools/testing/selftests/drivers/net/shaper.py
            !2, 3.6      tools/testing/selftests/drivers/net/queues.py
            !2, 3.6      tools/testing/selftests/drivers/net/ping.py
            !2, 3.6      tools/testing/selftests/drivers/net/lib/py/remote_ssh.py
            !2, 3.6      tools/testing/selftests/drivers/net/lib/py/load.py
            !2, 3.6      tools/testing/selftests/drivers/net/lib/py/__init__.py
            !2, 3.6      tools/testing/selftests/drivers/net/lib/py/env.py
            !2, 3.6      tools/testing/selftests/drivers/net/hw/rss_ctx.py
            !2, 3.6      tools/testing/selftests/drivers/net/hw/pp_alloc_fail.py
            !2, 3.6      tools/testing/selftests/drivers/net/hw/nic_performance.py
            !2, 3.6      tools/testing/selftests/drivers/net/hw/nic_link_layer.py
            !2, 3.6      tools/testing/selftests/drivers/net/hw/lib/py/linkconfig.py
            !2, 3.6      tools/testing/selftests/drivers/net/hw/lib/py/__init__.py
            !2, 3.6      tools/testing/selftests/drivers/net/hw/devmem.py
            !2, 3.6      tools/testing/selftests/drivers/net/hw/devlink_port_split.py
            !2, 3.6      tools/testing/selftests/drivers/net/hw/csum.py
            !2, 3.6      tools/testing/selftests/devices/probe/test_discoverable_devices.py
            !2, 3.6      tools/testing/selftests/bpf/test_bpftool_synctypes.py
            !2, 3.6      tools/testing/selftests/bpf/generate_udp_fragments.py
            !2, 3.6      tools/testing/kunit/run_checks.py
            !2, 3.6      tools/testing/kunit/kunit_printer.py
            !2, 3.6      tools/sched_ext/scx_show_state.py
            !2, 3.6      tools/perf/tests/shell/lib/perf_metric_validation.py
            !2, 3.6      tools/perf/tests/shell/lib/perf_json_output_lint.py
            !2, 3.6      tools/perf/scripts/python/parallel-perf.py
            !2, 3.6      tools/perf/scripts/python/flamegraph.py
            !2, 3.6      tools/perf/scripts/python/arm-cs-trace-disasm.py
            !2, 3.6      tools/perf/pmu-events/models.py
            !2, 3.6      tools/perf/pmu-events/metric_test.py
            !2, 3.6      tools/perf/pmu-events/metric.py
            !2, 3.6      tools/perf/pmu-events/jevents.py
            !2, 3.6      tools/net/ynl/ynl-gen-rst.py
            !2, 3.6      tools/net/ynl/ynl-gen-c.py
            !2, 3.6      tools/net/ynl/lib/ynl.py
            !2, 3.6      tools/net/ynl/lib/nlspec.py
            !2, 3.6      tools/crypto/tcrypt/tcrypt_speed_compare.py
            !2, 3.6      tools/cgroup/iocost_monitor.py
            !2, 3.6      tools/cgroup/iocost_coef_gen.py
            !2, 3.6      scripts/make_fit.py
            !2, 3.6      scripts/macro_checker.py
            !2, 3.6      scripts/get_abi.py
            !2, 3.6      scripts/generate_rust_analyzer.py
            !2, 3.6      scripts/gdb/linux/timerlist.py
            !2, 3.6      scripts/gdb/linux/pgtable.py
            !2, 3.6      scripts/clang-tools/run-clang-tools.py
            !2, 3.6      Documentation/sphinx/automarkup.py

[1] Checked with:
	vermin -v $(git ls-files *.py)

    Please notice that vermin is not perfect: my script passed as version 3.6
    because the f-string check there didn't verify f-string improvements over
    time. Still, it is a quick way to check that our current minimal version
    is not aligned with reality.
 
Btw, vermin explains what is requiring more at the scripts. For instance:

	$ vermin -vv scripts/checktransupdate.py
	...
	!2, 3.9      /new_devel/v4l/docs/scripts/checktransupdate.py
	  'argparse' module requires 2.7, 3.2
	  'argparse.BooleanOptionalAction' member requires !2, 3.9
	  'datetime' module requires 2.3, 3.0
	  'datetime.datetime.strptime' member requires 2.5, 3.0
	  'logging' module requires 2.3, 3.0
	  'logging.StreamHandler' member requires 2.6, 3.0
	  'os.path.relpath' member requires 2.6, 3.0
	  f-strings require !2, 3.6

Thanks,
Mauro


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
